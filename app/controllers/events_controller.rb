class EventsController < ApplicationController
  def index
    @event = Event.all
  end

  def new
   
  end

  def show
    @event = Event.last
    @user = User.select('user_name').where("id=#{@event.creator_id}").take
  end

  def create
    user_id = session[:current_user_id]
    
    @user=User.where("id='#{user_id}'").take
    @event = @user.created_events.build(title:"#{params[:title]}", description:"#{params[:description]}")
    
    
    if @event.save
      
      redirect_to events_show_path
    else
      
      render :new
    end
    
  end

end
