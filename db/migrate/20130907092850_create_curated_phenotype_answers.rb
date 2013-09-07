class CreateCuratedPhenotypeAnswers < ActiveRecord::Migration
  def change
    create_table :curated_phenotype_answers do |t|
      t.text :variation_name
      t.belongs_to :curated_phenotype

      t.timestamps
    end
  end
end
