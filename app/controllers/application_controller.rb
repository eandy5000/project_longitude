class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?
  # helper_method lets current_user and logged_in work in the views
  # all of the methods in the ApplicationsController can be used in other controllers 
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
  # !! converts anything into a boolean
  # retruns a boolean value based on if a current_user exists
    !!current_user
  end
  
  def require_user
    if !logged_in?
    flash[:danger] = "You must be logged in to proceed"
    redirect_to root_path
    end
  end
  
end
