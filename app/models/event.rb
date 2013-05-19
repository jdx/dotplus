class Event < ActiveRecord::Base
  belongs_to :city
  belongs_to :sponsor
  belongs_to :organizer, class_name: "User"
  belongs_to :location
  has_many :talks
  has_many :attendances
  has_many :attendees, through: :attendances, source: :user
  has_one :newbie_talk, -> { where newbie: true }, class_name: "Talk"
  has_one :advanced_talk, -> { where newbie: false }, class_name: "Talk"

  scope :by_date, -> { order(:start) }

  def to_param
    "#{id} #{start.to_date}".parameterize
  end

  def schedule
    [
      { what: "Mingle", time: start },
      { what: newbie_talk.try(:title) || "Beginner Talk", time: (start + 15.minutes), user: newbie_talk.try(:user) },
      { what: advanced_talk.try(:title) || "Advanced Talk", time: (start + 30.minutes), user: advanced_talk.try(:user) },
      { what: "Hack", time: (start + 75.minutes) },
      { what: "Bar", time: self.end },
    ]
  end
end
