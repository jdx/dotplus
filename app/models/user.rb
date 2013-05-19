class User < ActiveRecord::Base

  has_many :talks
  has_many :attendances
  has_many :attended_events, through: :attendances, source: :event

  validates :twitter, presence: true, uniqueness: true
  validates :email, uniqueness: true

  def to_param
    twitter
  end
end
