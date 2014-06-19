class SessionController < ApplicationController
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
