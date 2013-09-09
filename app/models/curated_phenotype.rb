class CuratedPhenotype < ActiveRecord::Base
  attr_accessible :description, :name, :timeseries
  has_many :curated_phenotype_answers
end
