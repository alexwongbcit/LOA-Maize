# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

class SomeScriptModel < ActiveRecord::Base
  require 'iconv'

  FILE_NAME = 'seed_data2.csv'

  def self.run
    file = FasterCSV.read(File.join(File.dirname(__FILE__), FILE_NAME))
    file.shift
    file.each do |row|

      site = Site.find_or_create_by_lat_and_lng(:name => clean_string(row[2]), :lat => row[1].to_f, :lng => row[0].to_f)
      sample = Sample.create(:site_id => site.id, :radiocarbon_age_bp => row[3], :std_dev => row[4], :lower_cal_date => row[5], :upper_cal_date => row[6], :median_cal_date => row[7], :lab_number => row[8])

      # Smith 1997:374
      # FIXME: not importing correct publications
      for ref in row[10].to_s.split(';')
        match = ref.match(/(.*)(?::(.+)?)/)
        if match
          puts ref
          puts citation = clean_string(match[1])
          puts page = match[2]
          puts ""
          publication = Publication.find_or_create_by_citation(:citation => citation)
          Reference.create(:sample_id => sample.id, :publication_id => publication.id, :page => clean_string(page))
        end
      end
    end
  end

  def self.clean_string(string)
    ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')
    return ic.iconv(string)[0..-2]
  end
end

SomeScriptModel.run
