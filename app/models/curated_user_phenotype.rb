class CuratedUserPhenotype < ActiveRecord::Base
  attr_accessible :belongs_to, :time_of_data_point, :comment, :is_multiple, :is_series
  belongs_to :curated_user_phenotype_answers
end
