class EventsController < ApplicationController
  def index
    @event = Event.all
    @event_past = @event.past
    @event_upcoming = @event.upcoming
  end

  def new
    @user = User.all
  end

  def show
    event_id = params[:id]
    @event = User.joins(:attended_events).where("attended_event_id='#{event_id}'")
  end

  def create
    user_id = session[:current_user_id]

    @user = User.where("id='#{user_id}'").take
    @event = @user.created_events.build(title: params[:title].to_s, description: params[:description].to_s,
                                        date: params[:date], location: params[:location])

    if @event.save

      redirect_to events_index_path
    else

      render :new
    end
  end
end
