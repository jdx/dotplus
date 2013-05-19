class Event < ActiveRecord::Base
  belongs_to :city
  belongs_to :sponsor
  belongs_to :organizer, class_name: "User"
  belongs_to :location
  has_many :talks
  has_one :newbie_talk, class_name: "Talk", conditions: { newbie: true }
  has_one :advanced_talk, class_name: "Talk", conditions: { newbie: false }

  scope :by_date, order(:start)

end
