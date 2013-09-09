class CuratedPhenotypeAnswer < ActiveRecord::Base
  belongs_to :curated_phenotype
  has_many :curated_user_phenotypes

  attr_accessible :variation_name
end
