class EventsController < ApplicationController
  def index
  end

  def show
    @event = current_city.events.where(date: params[:id])
  end
end
