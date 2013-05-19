module Admin
  class SponsorsController < BaseController
    def index
      @sponsors = Sponsor.all
    end

    def show
      @sponsor = Sponsor.find(params[:id])
    end

    def new
      @sponsor = Sponsor.new
    end

    def create
      @sponsor = Sponsor.new(sponsor_params)
      if @sponsor.save
        flash[:success] = "Created #{@sponsor.name}"
        redirect_to admin_sponsor_path(@sponsor)
      else
        render :new
      end
    end

    def edit
      @sponsor = Sponsor.find(params[:id])
    end

    def update
      @sponsor = Sponsor.find(params[:id])
      if @sponsor.update_attributes(sponsor_params)
        flash[:success] = "Updated #{@sponsor.name}"
        redirect_to admin_sponsor_path(@sponsor)
      else
        render :edit
      end
    end

    private
    def sponsor_params
      params.require(:sponsor).permit(:name)
    end
  end
end
