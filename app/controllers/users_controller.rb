class UsersController < ApplicationController
  def sign_in
    @user = User.new
  end

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
    @event = Event.joins(:attendees).where("attendee_id=#{session[:current_user_id]}")
  end
end
