class AttendeesController < ApplicationController
  def rsvp
    Attendance.where(user_id: current_user, event_id: event).first_or_create!
    current_user.add_city(current_city.subdomain)
    flash[:success] = "You have RSVP'ed"
    redirect_to event_path(event)
  end

  def destroy
    attendance = Attendance.where(user_id: current_user, event_id: event).first
    attendance.try(:destroy)
    flash[:success] = "You have canceled your reservation"
    redirect_to event_path(event)
  end

  private
  def event
    @event ||= Event.find(params[:event_id])
  end
end
