class UsersController < ApplicationController
  def new
  end

  def create
  end

  def show
    @user = User.all
  end
end
