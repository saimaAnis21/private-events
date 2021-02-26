class EventsController < ApplicationController
  def index
    @event = Event.all
  end

  def new
   
  end

  def show
    # @event=EventAttendee.joins(:attendee).select("attendee_id").where("attended_event_id=7")
    @event = User.joins(:attended_events).where("attended_event_id=9")
    
    
  end

  def create
    user_id = session[:current_user_id]
    
    @user=User.where("id='#{user_id}'").take
    @event = @user.created_events.build(title:"#{params[:title]}", description:"#{params[:description]}")
    
    
    if @event.save
      
      redirect_to events_index_path
    else
      
      render :new
    end
    
  end

end
