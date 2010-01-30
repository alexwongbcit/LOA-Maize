class Sample < ActiveRecord::Base
  belongs_to :site
  has_many :references
  has_many :publications, :through => :references
end
