class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  around_filter :set_time_zone

  protected

  def subdomain
    request.subdomain
  end
  helper_method :subdomain

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.try(:id)
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
  helper_method :current_user

  def current_city
    @current_city ||= City.find_by_subdomain(request.subdomain)
  end
  helper_method :current_city

  def set_time_zone(&block)
    Time.use_zone(current_city.try(:time_zone) || "UTC", &block)
  end
end
