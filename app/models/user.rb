class User < ActiveRecord::Base

  validates :twitter, presence: true, uniqueness: true
  validates :email, uniqueness: true

  def to_param
    twitter
  end
end
