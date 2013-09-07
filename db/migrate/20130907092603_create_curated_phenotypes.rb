class CreateCuratedPhenotypes < ActiveRecord::Migration
  def change
    create_table :curated_phenotypes do |t|
      t.string :name
      t.boolean :timeseries
      t.text :description

      t.timestamps
    end
  end
end
