class CuratedPhenotype < ActiveRecord::Base
  attr_accessible :description, :name, :timeseries, :is_series, :is_multiple
  # Name is the name of the phenotype
  # Description is text describing the phenotype
  # Timeseries is a boolean indicating whether there are several possible answers for different timepoints
  # is_series is a boolean indicating whether possible answers are continuous, i.e., height
  # is_multiple is a boolean indicating that several answers are possible, i.e., allergies
  has_many :curated_phenotype_answers
  has_many :users, through: :curated_phenotype_answers, :source => :curated_user_phenotypes

  searchable do
    text :description, :name
  end
end
