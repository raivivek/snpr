class LinkSnpPhenotype
  include Sidekiq::Worker
  sidekiq_options :queue => :link_snp_phenotype, :unique => true
  attr_reader :snp, :characteristics, :papers_count

  def perform(snp_id)
    # could possibly use the max_age limit here
    @snp = Snp.find(snp_id)
    @characteristics = Phenotype.all.map { |x| x.characteristic }
    @papers_count = 0
    score_phenotype snp
  end

  def score_phenotype(snp)
    plos = score_paper(:plos_papers, 2.0)
    snpedia = score_paper(:snpedia_papers, 5.0)
    pgp = score_paper(:pgp_annotations, 2.0)
    genomegov = score_paper(:genome_gov_papers, 2.0)
    mendeley = score_paper(:mendeley_papers, 1.0)

    all_scores = [snpedia, pgp, genomegov, mendeley].reduce(plos) do |x, y|
      x.merge(y) do |k, v1, v2|
        v1 + v2
      end
    end

    all_scores = all_scores.sort_by {|k, v| v}

    all_scores.take(10).each do |k, v|
      ph = Phenotype.find_by_characteristic(k)
      PhenotypeSnp.find_or_create_by(:snp_id => snp.id,
                                     :phenotype_id => ph.id)
                  .update_attributes!(:score => v)
    end
  end

  def score_paper(paper_type, weight)
    score = {}

    papers = @snp.public_send(paper_type)
    @papers_count += papers.length

    # search for each phenotype one by one in the papers' metadata
    @characteristics.each do |chr|
      papers.each do |p|
        title = if p.class.method_defined? :title then p.title else p.summary end

        if title.downcase.include? chr
          score[chr] = 0.0 if score[chr].nil?
          score[chr] += weight
        end
      end

      unless score[chr].nil?
        score[chr] /= papers.length
      end
    end
    score
  end
end
