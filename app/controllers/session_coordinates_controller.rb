class SessionCoordinatesController < ApplicationController
  def create
    coordinates = "%s,%s" % [params[:latitude], params[:longitude]]
    session[:coordinates] = coordinates
    @deals = Deal.active.near(session_coordinates)
  end
end
