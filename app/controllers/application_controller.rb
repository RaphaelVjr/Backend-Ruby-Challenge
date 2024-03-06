class ApplicationController < ActionController::Base
  helper_method :current_user, :user_signed_in?
  helper_method :current_user, :logged_in?

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    !!current_user
  end

  def logged_in?
    !!current_user
  end

  def authenticate_user!
    unless logged_in?
      flash[:alert] = "You must be logged in to access this page"
    end
  end
end
