class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  before_action :ensure_logged_in

  private

  def current_user
    unless session[:user_id].nil?
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    else
      redirect_to root_path
    end
  end

  def ensure_logged_in
    if session[:user_id].nil?
      redirect_to "/signin"
    end
  end

end
