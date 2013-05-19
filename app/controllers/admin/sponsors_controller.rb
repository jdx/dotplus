module Admin
  class SponsorsController < BaseController
    def index
      @sponsors = Sponsor.all
    end

    def show
      @sponsor = Sponsor.find(params[:id])
    end

    def edit
      @sponsor = Sponsor.find(params[:id])
    end

    def update
      @sponsor = Sponsor.find(params[:id])
      if @sponsor.update_attributes(sponsor_params)
        redirect_to admin_sponsor_path(@sponsor), success: "Updated #{@sponsor.name}"
      else
        render :edit
      end
    end

    private
    def sponsor_params
      params.require(:sponsor).permit(:name, :address, :notes)
    end
  end
end
