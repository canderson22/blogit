class UsersController < ApplicationController
  before_action :authorize, only: [:show, :edit, :update, :destroy]
  def index
  end

  def show
    # show specific user
    @user = User.find(params[:id])
    @blog = Blog.where(user_id: @user.id).all.last
    @pub_blog = Blog.where.not(user_id: @user.id).all.last
    @comment = Comment.where(user_id: @user.id).all.last
    no_access
  end

  def new
    # start to create new user
    @user = User.new
  end

  def create
    # create new user
    if logged_in? == true
      flash[:danger] = "User already logged in, please log out first!"
      redirect_to user_path(current_user)
      return
    end
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
    no_access
  end

  def update
    # update existing user
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile successfully updated"
      redirect_to user_path(@user.id)
    else
      flash[:danger] = "Please enter a password"
      redirect_to edit_user_path(@user.id)
    end
  end

  def destroy
    # delete user completely
    @user = User.find(params[:id])
    if current_user.id != @user.id
      flash[:warning] = "You dont have access!"
      redirect_to user_path(session[:user_id])
    end
    Blog.where(:user_id => @user.id).destroy_all
    Comment.where(:user_id => @user.id).destroy_all
    @user.destroy
    session[:user_id] = nil
    flash[:danger] = "User page deleted!"
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:f_name, :l_name, :email, :password, :password_confirmation, :image)
  end
  
end
