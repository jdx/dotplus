class EventsController < ApplicationController
  def index
    event = current_city.events.order('start').last
    if event
      redirect_to event_path(event)
    else
      render :no_event
    end
  end

  def show
    @event = current_city.events.includes(:attendees).find_by_id(params[:id])
    return redirect_to root_path unless @event
    @attending = @event.attendees.include?(current_user)
  end
end
