class CreateCuratedPhenotypes < ActiveRecord::Migration
  def change
    create_table :curated_phenotypes do |t|
      t.string :name
      t.boolean :timeseries
      t.text :description
      t.boolean :is_series
      t.boolean :is_multiple

      t.timestamps
    end
  end
end
