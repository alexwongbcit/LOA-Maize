class Publication < ActiveRecord::Base
  has_many :references
  has_many :samples, :through => :references
end
