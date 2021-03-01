class UsersController < ApplicationController
  def sign_up
    @user = User.new
  end

  def create
    @user = User.new(email: params[:email], user_name: params[:user_name])

    if @user.save

      redirect_to users_sign_in_path
    else

      render :new
    end
  end

  def sign_in; end

  def logged_in
    @user = User.where("user_name='#{params[:username]}'").take
    session[:current_user_id] = @user.id
    session[:current_user_name] = @user.user_name.to_s
    session[:logged_in] = true
    redirect_to users_show_path
  end

  def log_out
    reset_session
    redirect_to users_sign_in_path
  end

  def show
    # @event = Event.joins(:attendees).where("attendee_id=#{session[:current_user_id]}")
    @usr = User.find(session[:current_user_id])
    @event = @usr.attended_events
  end
end
