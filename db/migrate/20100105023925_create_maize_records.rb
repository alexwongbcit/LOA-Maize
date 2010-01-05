class CreateMaizeRecords < ActiveRecord::Migration
  def self.up
    create_table :maize_records do |t|
      t.belongs_to :site
      t.column :description, :text
      t.column :age, :integer
      t.timestamps
    end
    add_index :maize_records, :site_id
    add_index :maize_records, :age
  end

  def self.down
    drop_table :maize_records
  end
end
