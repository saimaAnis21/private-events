class UsersController < ApplicationController
  def sign_in
    @user = User.new
  end

  def logged_in
    @user = User.where("user_name='#{params[:username]}'").take
    session[:current_user_id] = @user.id
    session[:current_user_name] = "#{@user.user_name}"
    session[:logged_in] = true
    redirect_to users_show_path
  end

  def show
    # @event = Event.where("creator_id = #{session[:current_user_id]}")
    @event = Event.joins(:attendees).where("attendee_id=#{session[:current_user_id]}")
  end
end
