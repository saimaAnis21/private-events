class UsersController < ApplicationController
  def sign_up
    @user = User.new
  end

  def create
    @user = User.new(email: params[:email], user_name: params[:user_name])

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_sign_in_path, notice: 'User was successfully created.' }
        format.json { render :sign_in, status: :created, location: @user }
      else
        format.html do
          redirect_to users_sign_up_path, alert: 'User not created because of entering invalid email or username!'
        end
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def sign_in; end

  def logged_in
    @user = User.where("user_name='#{params[:username]}'").take
    if !@user.nil?
      session[:current_user_id] = @user.id
      session[:current_user_name] = @user.user_name.to_s
      session[:logged_in] = true
      redirect_to users_show_path
    else
      render :sign_in
    end
  end

  def log_out
    reset_session
    redirect_to users_sign_in_path
  end

  def show
    if logged_in?
      @usr = User.find(session[:current_user_id])
      @event = @usr.attended_events
    else
      redirect_to users_sign_in_path
    end
  end
end
