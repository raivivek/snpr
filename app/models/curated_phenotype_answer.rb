class CuratedPhenotypeAnswer < ActiveRecord::Base
  belongs_to :curated_phenotype
  has_and_belongs_to_many :curated_user_phenotypes

  attr_accessible :variation_name, :curated_phenotype_id
end
