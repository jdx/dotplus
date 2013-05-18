class User < ActiveRecord::Base

  def to_param
    twitter
  end
end
