class City < ActiveRecord::Base

  def to_param
    subdomain
  end
end
