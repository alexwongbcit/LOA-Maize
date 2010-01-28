class CreateReferences < ActiveRecord::Migration
  def self.up
    create_table :references do |t|
      t.belongs_to :sample, :null => false
      t.belongs_to :publication, :null => false
      t.string :page
      t.timestamps
    end

    add_index :references, :sample_id
    add_index :references, :publication_id
  end

  def self.down
    drop_table :references
  end
end
