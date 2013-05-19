module Admin
  class EventsController < BaseController
    def index
      @events = current_city.events
    end

    def show
      @event = Event.find(params[:id])
    end

    def new
      @event = Event.new
    end

    def create
      @event = Event.new(event_params)
      @event.city = current_city
      if @event.save
        redirect_to admin_event_path(@event), success: "Created event"
      else
        render :new
      end
    end

    private
    def event_params
      params.require(:event).permit(:start, :end, :sponsor_id, :organizer, :food)
    end
  end
end
