class CreateJawboneWeights < ActiveRecord::Migration
  def self.up
	  create_table :jawbone_weights do |t|
		  t.belongs_to :jawbone_profile
		  t.float :bmi
      t.float :body_fat
      t.float :weight
      t.timestamp :date_logged
		  t.timestamps
	  end
  end

  def self.down
  	drop_table :jawbone_weights
  end

end
