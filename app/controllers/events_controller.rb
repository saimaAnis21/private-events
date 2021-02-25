class EventsController < ApplicationController
  def index
    @event = Event.all
  end

  def new
   
  end

  def show
    @user_attendees = []
    @event = Event.where('id=9').take
    @user = User.select('user_name').where("id=#{@event.creator_id}").take
    attendees = EventAttendee.select('attendee_id').where("attended_event_id=#{@event.id}").take
    
    attendees.each do |x|
      @user_attendees.push(User.select('user_name').where("id=#{x.attendee_id}").take)
    end 
    
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
