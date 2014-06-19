class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :has_coordinates?, :session_coordinates

  def has_coordinates?
    session_coordinates.present?
  end

  def session_coordinates
    @session_coordinates ||= session[:coordinates]
  end
end
