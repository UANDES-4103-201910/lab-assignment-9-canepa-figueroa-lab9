class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  def index

  end

  def current_user
    @current_user ||= session[:current_user_id] && User.find_by_id(session[:current_user_id])
  end

  def is_user_logged_in?
	#complete this method
  	logged_in = current_user
	if logged_in then   true else redirect_to root_path end
  end
end
