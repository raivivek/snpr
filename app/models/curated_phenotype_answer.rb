class CuratedPhenotypeAnswer < ActiveRecord::Base
  belongs_to :curated_phenotype

  attr_accessible :variation_name
end
