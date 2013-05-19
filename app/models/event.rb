class Event < ActiveRecord::Base
  belongs_to :city
  belongs_to :sponsor
  belongs_to :organizer, class_name: "User"
  has_many :talks
  has_one :newbie_talk, class_name: "Talk", conditions: { newbie: true }
  has_one :advanced_talk, class_name: "Talk", conditions: { newbie: false }

  scope :by_date, order(:start)

  after_create :add_talks

  private
  def add_talks
    self.newbie_talk ||= Talk.create!(event: self, newbie: true)
    self.advanced_talk ||= Talk.create!(event: self, newbie: false)
  end
end
