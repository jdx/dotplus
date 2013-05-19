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
        flash[:success] = "Created event"
        redirect_to admin_event_path(@event)
      else
        render :new
      end
    end

    def edit
      @event = Event.find(params[:id])
    end

    def update
      @event = Event.find(params[:id])
      if @event.update_attributes(event_params)
        flash[:success] = "Updated event"
        redirect_to admin_event_path(@event)
      else
        render :edit
      end
    end

    private
    def event_params
      params.require(:event).permit(:start, :end, :sponsor_id, :organizer, :food, :beginner_talk_id, :advanced_talk_id)
    end
  end
end
