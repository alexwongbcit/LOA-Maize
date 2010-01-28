class CreatePublications < ActiveRecord::Migration
  def self.up
    create_table :publications do |t|
      t.text :citation, :null => false
      t.timestamps
    end

    add_index :publications, :citation
  end

  def self.down
    drop_table :publications
  end
end
