class Sponsor < ActiveRecord::Base
  has_many :events
end
