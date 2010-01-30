class Reference < ActiveRecord::Base
  belongs_to :sample
  belongs_to :publication
end
