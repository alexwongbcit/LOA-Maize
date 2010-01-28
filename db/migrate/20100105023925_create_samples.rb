class CreateSamples < ActiveRecord::Migration
  def self.up
    create_table :samples do |t|
      t.belongs_to :site, :null => false
      t.text :description
      t.integer :radiocarbon_age_bp
      t.integer :std_dev
      t.integer :lower_cal_date
      t.integer :upper_cal_date
      t.integer :median_cal_date
      t.string :lab_number

      t.timestamps
    end
    add_index :samples, :site_id
    add_index :samples, :radiocarbon_age_bp
    add_index :samples, :lower_cal_date
    add_index :samples, :upper_cal_date
    add_index :samples, :median_cal_date
    add_index :samples, :lab_number
  end

  def self.down
    drop_table :samples
  end
end
