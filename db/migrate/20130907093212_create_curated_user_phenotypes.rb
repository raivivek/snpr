class CreateCuratedUserPhenotypes < ActiveRecord::Migration
  def change
    create_table :curated_user_phenotypes do |t|
      t.belongs_to :user
      t.belongs_to :curated_phenotype
      t.belongs_to :curated_phenotype_answer
      t.datetime :time_of_data_point
      t.text :comment

      t.timestamps
    end
  end
end
