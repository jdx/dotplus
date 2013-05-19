class User < ActiveRecord::Base

  has_many :talks

  validates :twitter, presence: true, uniqueness: true
  validates :email, uniqueness: true

  def to_param
    twitter
  end
end
