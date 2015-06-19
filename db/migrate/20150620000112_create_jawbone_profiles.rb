class CreateJawboneProfiles < ActiveRecord::Migration
  def self.up
	  create_table :jawbone_profiles do |t|
	    t.string :jawbone_user_id
		  t.belongs_to :user
		  t.string :token
      t.string :refresh_token
      t.timestamp :expires_at
      t.boolean :weight, :default => true
      t.boolean :move, :default => true
      t.boolean :sleep, :default => true
		  t.timestamps
	  end
  end

  def self.down
  	drop_table :jawbone_profiles
  end

end
