class UsersController < ApplicationController
  before_action :authorize, only: [:show, :edit, :update, :destroy]
  def index
  end

  def show
    # show specific user
    @user = User.find(params[:id])
    @categories = Category.all
    if current_user.id != @user.id
      flash[:warning] = "You dont have access!"
      redirect_to user_path(session[:user_id])
    end
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
      flash[:warning] = "Please double check all fields"
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
    if current_user.id != @user.id
      flash[:warning] = "You dont have access!"
      redirect_to user_path(session[:user_id])
    end
  end

  def update
    # update existing user
    begin
    @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      # handle not found error
      flash[:danger] = "That page does not exist."
      redirect_to user_path(current_user)
    rescue ActiveRecord::ActiveRecordError
      # handle other ActiveRecord errors
      flash[:warning] = "Sorry there was an error."
    rescue # StandardError
      # handle most other errors
    rescue Exception
      # handle everything else
      @user.update_attributes(user_params)
      flash[:success] = "Profile successfully updated"
      redirect_to user_path(@user)
    else
      flash[:warning] = "Please check all fields"
      redirect_to edit_user_path(@user)
    end
 
  end

  def destroy
    # delete user completely
    @user = User.find(params[:id])
    if current_user.id != @user.id
      flash[:warning] = "You dont have access!"
      redirect_to user_path(session[:user_id])
    end
    @user.destroy
    session[:user_id] = nil
    flash[:danger] = "User page deleted!"
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:f_name, :l_name, :email, :password, :password_confirmation)
  end
end
