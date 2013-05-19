class UsersController < ApplicationController
  def show
  end

  def update
    if current_user.update_attributes(user_params)
      redirect_to :back
    else
      render :edit
    end
  end

  protected

  def user
    @user ||= User.find_by_twitter(params[:id])
  end
  helper_method :user

  def user_params
    params.require(:user).permit(:email)
  end
end
