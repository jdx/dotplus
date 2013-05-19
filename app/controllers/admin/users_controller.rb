module Admin
  class UsersController < BaseController
    def index
      @users = User.all
    end

    def show
      @user = User.find_by_twitter(params[:id])
      redirect_to user_path(@user)
    end
  end
end
