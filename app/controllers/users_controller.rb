class UsersController < ApplicationController
  def show
  end

  protected

  def user
    @user ||= User.find_by_twitter(params[:id])
  end
  helper_method :user
end
