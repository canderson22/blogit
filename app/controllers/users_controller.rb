class UsersController < ApplicationController
  before_action :authorize, only: [:show, :edit, :update, :destroy]
  def index
  end

  def show
    # show specific user
    @user = User.find(session[:user_id])
  end

  def new
    # start to create new user
    @user = User.new
  end

  def create
    # create new user
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else 
      redirect_to new_user_path
    end
  end

  def edit
    #edit existing user
  end

  def update
    # update existing user
  end

  def destroy
    # delete user completely
  end

  private
  def user_params
    params.require(:user).permit(:f_name, :l_name, :email, :password, :password_confirmation)
  end
end
