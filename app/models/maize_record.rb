class MaizeRecord < ActiveRecord::Base

  belongs_to :site

  # override the rails attribute (getter)
  def description
    Base64::decode64(self[:name])
  end

  # override the rails attribute (setter)
  def description=(value)
    self[:name] = Base64::encode64(value)
  end
end
