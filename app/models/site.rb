class Site < ActiveRecord::Base
  has_many :samples

  def to_s
    name
  end
end
