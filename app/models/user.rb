class User < ActiveRecord::Base

  has_many :talks
  has_many :attendances
  has_many :attended_events, through: :attendances, source: :event
  has_many :posts, as: :postable

  validates :twitter, presence: true, uniqueness: true
  validates :email, uniqueness: true

  def to_param
    twitter
  end

  def add_city(city_code)
    self.update_attribute(:cities, cities + [city_code]) unless cities.include?(city_code)
  end

  def event_role event
    if event.beginner_speaker == self ||
       event.advanced_speaker == self
      'speaker'
    elsif event.organizer_id == id
      'organizer'
    end
  end

  def last_name
    name.split(' ', 2).last
  end
end
