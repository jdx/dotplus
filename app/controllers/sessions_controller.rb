class SessionsController < ApplicationController
  def create
    self.current_user = User.where(twitter: auth_hash[:info][:nickname]).first_or_initialize
    current_user.name = auth_hash[:info][:name]
    current_user.avatar = auth_hash[:info][:image]
    current_user.location = auth_hash[:info][:location]
    current_user.url = auth_hash[:info][:urls]["Website"]
    current_user.bio = auth_hash[:info][:description]
    current_user.save!
    flash[:success] = "Signed in from Twitter"

    redirect_to root_url(subdomain: params[:subdomain])
  end

  def failure
    flash[:alert] = "Error authenticating with Twitter: #{params[:message]}"
    redirect_to root_path
  end

  def destroy
    self.current_user = nil

    redirect_to root_path, success: "Signed out"
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
