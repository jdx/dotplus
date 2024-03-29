module Admin
  class LocationsController < BaseController
    def index
      @locations = Location.all
    end

    def show
      @location = Location.find(params[:id])
    end

    def edit
      @location = Location.find(params[:id])
    end

    def update
      @location = Location.find(params[:id])
      if @location.update_attributes(location_params)
        flash[:success] = "Updated #{@location.name}"
        redirect_to admin_location_path(@location)
      else
        render :edit
      end
    end

    private
    def location_params
      params.require(:location).permit(:name, :address, :notes)
    end
  end
end
