class Talk < ActiveRecord::Base
  belongs_to :city
  belongs_to :user

  validates :title, presence: true, length: { maximum: 30 }
  validates :description, presence: true, length: { maximum: 200 }

  def to_param
    "#{id} #{title}".parameterize
  end
end
