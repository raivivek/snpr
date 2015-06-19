class CreateJawboneSleeps < ActiveRecord::Migration
  def self.up
	  create_table :jawbone_sleeps do |t|
		  t.belongs_to :jawbone_profile
		  t.timestamp :date_logged
      t.integer :awake
      t.integer :duration
      t.integer :times_awake
		  t.timestamps
	  end
  end

  def self.down
  	drop_table :jawbone_sleeps
  end

end
