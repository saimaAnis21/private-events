class UsersController < ApplicationController
  def sign_in
    @user = User.new
  end

  def logged_in
    @user = User.where("user_name='#{params[:username]}'").take
    session[:current_user_id] = @user.id
    session[:current_user_name] = "#{@user.user_name}"
    redirect_to users_show_path
  end

  def show
     @user = User.all
  end
end
