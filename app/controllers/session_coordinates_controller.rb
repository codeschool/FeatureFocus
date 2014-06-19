class SessionCoordinatesController < ApplicationController
  def create
    coordinates = "%s,%s" % [params[:latitude], params[:longitude]]
    session[:coordinates] = coordinates
    head 200
  end
end
