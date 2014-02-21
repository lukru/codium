class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception

  before_filter :authenticate_user! 

  def after_sign_in_path_for(resource)
    {controller: "/home", action: :index}
  end
end
