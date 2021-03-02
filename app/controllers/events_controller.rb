class EventsController < ApplicationController
  def index
    if logged_in?
      @event = Event.all
      @event_past = @event.past
      @event_upcoming = @event.upcoming
    else
      redirect_to users_sign_in_path
    end
  end

  def new
    if logged_in?
      @user = User.all
    else
      redirect_to users_sign_in_path
    end
  end

  def show
    if logged_in?
      event_id = params[:id]
      @title = params[:title]
      @event = User.joins(:attended_events).where("attended_event_id='#{event_id}'")
    else
      redirect_to users_sign_in_path
    end
  end

  def create
    if logged_in?
      user_id = session[:current_user_id]

      @user = User.where("id='#{user_id}'").take
      @event = @user.created_events.build(title: params[:title].to_s, description: params[:description].to_s,
                                          date: params[:date], location: params[:location])

      if @event.save

        redirect_to events_index_path
      else
        render :new
      end
    else
      redirect_to users_sign_in_path
    end
  end
end
