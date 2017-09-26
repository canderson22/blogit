class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authorize, :no_access

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def authorize
    unless logged_in?
      redirect_to new_session_path
    end
  end

  def no_access 
    if current_user.id != @user.id
      flash[:warning] = "You dont have access!"
      redirect_to user_path(session[:user_id])
    end
  end

end
