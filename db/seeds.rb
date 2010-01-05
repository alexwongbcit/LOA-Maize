# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

class SomeScriptModel < ActiveRecord::Base
  require 'iconv'

  FILE_NAME = 'seed_data.csv'

  def self.run
    file = FasterCSV.read(File.join(File.dirname(__FILE__), FILE_NAME))
    file.shift
    file.each do |row|
      ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')
      description = ic.iconv("#{row[6]}#{row[7]}" + ' ')[0..-2]

      site = Site.find_or_create_by_lat_and_lng(:name => row[2], :lat => row[0], :lng => row[1], :region => row[4], :country => row[5])
      MaizeRecord.create(:site_id => site.id, :age => row[3], :description => description)
    end
  end
end

SomeScriptModel.run
