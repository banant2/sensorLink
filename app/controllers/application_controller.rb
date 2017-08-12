class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_action :set_variables
  def set_variables
    @active_user = @current_user.id
    pp @active_user
  end
end
