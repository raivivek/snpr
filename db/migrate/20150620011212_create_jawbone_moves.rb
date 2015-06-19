class CreateJawboneMoves < ActiveRecord::Migration
  def self.up
	  create_table :jawbone_moves do |t|
		  t.belongs_to :jawbone_profile
		  t.timestamp :date_logged
      t.integer :steps
      t.float :distance
		  t.timestamps
	  end
  end

  def self.down
  	drop_table :jawbone_moves
  end

end
