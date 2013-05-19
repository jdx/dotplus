class City < ActiveRecord::Base

  validates :subdomain, presence: true, uniqueness: true

  has_many :events

  def to_param
    subdomain
  end
end
