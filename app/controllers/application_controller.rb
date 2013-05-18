class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

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
end
