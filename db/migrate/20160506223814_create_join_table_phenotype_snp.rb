class CreateJoinTableSnpPhenotype < ActiveRecord::Migration
  def self.up
    create_table :snps_phenotypes, id: false do |t|
      t.integer :snp_id
      t.integer :phenotype_id
      t.float :score
    end

    add_index :snps_phenotypes, [:snp_id, :phenotype_id]
  end

  def self.down
    drop_table :snps_phenotypes
  end
end
