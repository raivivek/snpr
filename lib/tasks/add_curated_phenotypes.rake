namespace :curated_phenotypes do
  desc "Adds all possible curated phenotypes. CuratedUserPhenotypes have to be added manually later."
  task :all => :environment do
    if CuratedPhenotype.count != 0
      puts "Everything already done." # Alternative: Drop table
      exit
    end
    c = CuratedPhenotype.create(:name => "Hair color", :description => "Color of hair.", :timeseries => false)
    ["Light blond", "Blond", "Dark blond", "Brown", "Dark Brown", "Red", "Red blond"].each do |p|
      CuratedPhenotypeAnswer.create(:variation_name => p, :curated_phenotype_id => c.id)
    end

    c = CuratedPhenotype.create(:name => "Hair type", :description => "Form of hair.", :timeseries => false)
    ["Straight", "Wavy", "Curly"].each do |p|
      CuratedPhenotypeAnswer.create(:variation_name => p, :curated_phenotype_id => c.id)
    end
  end
end
