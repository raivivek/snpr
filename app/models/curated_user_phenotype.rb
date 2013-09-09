class CuratedUserPhenotype < ActiveRecord::Base
  attr_accessible :belongs_to, :belongs_to, :belongs_to, :time_of_data_point, :comment
  has_and_belongs_to_many :curated_user_phenotype_answers
end
