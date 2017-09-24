class UsersController < ApplicationController
  def index
  end

  def show
    # show specific user
  end

  def new
    # start to create new user
    @user = User.new
  end

  def create
    # create new user
    @user = User.new(user_params)
    if @user.save
      good
    else 
      bad
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
