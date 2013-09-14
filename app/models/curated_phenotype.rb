class CuratedPhenotype < ActiveRecord::Base
  attr_accessible :description, :name, :timeseries
  has_many :curated_phenotype_answers
  has_many :users, through: :curated_phenotype_answers, :source => :curated_user_phenotypes

  searchable do
    text :description, :name
  end
end
