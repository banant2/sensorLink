class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #before_action :authenticate_user!
  #before_action :set_variables
  #def set_variables
  #  @active_user = @current_user.id
  #  pp @active_user
  #end

  #def current_user
  #  @current_user ||= User.find(session[:user_id]) if session[:user_id]
  #  pp @current_user
  #end
end
