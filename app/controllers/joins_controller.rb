class JoinsController < ApplicationController
  def create
  	@event = Event.where(id: params['event_id']).first
  	@attendee = Attendee.create(user: current_user, event: @event)
  	redirect_to '/events'
  end

  def destroy
  	@attendance = Attendee.where(event_id: params['event_id'], user_id: session[:user_id]).first.destroy
  	redirect_to '/events'
  end
end
