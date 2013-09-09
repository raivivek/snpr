namespace :curated_phenotypes do
  desc "Adds all possible curated phenotypes. CuratedUserPhenotypes have to be added manually later."
  task :create => :environment do
    if CuratedPhenotype.count != 0
      puts "Everything already done." # Alternative: Drop table
      exit
    end
  make_phenotype("Hair color", "Color of hair.", false, ["Light blond", "Blond", "Dark Blond", "Brown", "Dark brown", "Red", "Red blond"])
  make_phenotype("Hair type", "Form of hair.", false, ["Straight", "Wavy", "Curly"])
  end

  def make_phenotype(name, description, timeseries, children)
    c = CuratedPhenotype.create(:name => name, :description => description, :timeseries => timeseries)
    children.each do |ch|
      CuratedPhenotypeAnswer.create(:variation_name => ch, :curated_phenotype_id => c.id)
    end
  end
end
