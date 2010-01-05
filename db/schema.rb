# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100105023925) do

  create_table "maize_records", :force => true do |t|
    t.integer  "site_id"
    t.text     "description"
    t.integer  "age"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "maize_records", ["age"], :name => "index_maize_records_on_age"
  add_index "maize_records", ["site_id"], :name => "index_maize_records_on_site_id"

  create_table "sites", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "region",     :null => false
    t.string   "country",    :null => false
    t.float    "lat",        :null => false
    t.float    "lng",        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sites", ["country"], :name => "index_sites_on_country"
  add_index "sites", ["lat"], :name => "index_sites_on_lat"
  add_index "sites", ["lng"], :name => "index_sites_on_lng"
  add_index "sites", ["name"], :name => "index_sites_on_name"
  add_index "sites", ["region"], :name => "index_sites_on_region"

end
