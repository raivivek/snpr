class CuratedPhenotypeAnswer < ActiveRecord::Base
  belongs_to :curated_phenotype
  has_many :curated_user_phenotypes

  attr_accessible :variation_name, :curated_phenotype_id

  searchable do
    text :variation_name
  end
end
