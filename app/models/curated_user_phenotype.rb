class CuratedUserPhenotype < ActiveRecord::Base
  attr_accessible :belongs_to, :time_of_data_point, :comment, :user_id, :curated_phenotype_id, :curated_phenotype_answer_id
  belongs_to :user
  belongs_to :curated_phenotype
end
