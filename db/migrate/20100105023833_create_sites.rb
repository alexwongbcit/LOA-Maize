class CreateSites < ActiveRecord::Migration
  def self.up
    create_table :sites do |t|
      t.column :name, :string, :null => false
      t.column :location_name, :string
      t.column :lat, :float, :null => false
      t.column :lng, :float, :null => false
      t.timestamps
    end

    add_index :sites, :name
    add_index :sites, :location_name
    add_index :sites, :lat
    add_index :sites, :lng
  end

  def self.down
    drop_table :sites
  end
end
