module Admin
  class BaseController < ApplicationController
    before_filter :authorize!

    layout 'admin'

    private
    def authorize!
      redirect_to admin_root_url(subdomain: 'la') unless current_city
      redirect_to root_path, alert: "Access denied" unless current_user.admin?
    end
  end
end
