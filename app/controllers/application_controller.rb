class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :has_coordinates?, :session_coordinates, :has_referrer?,
    :current_user

  before_action :authenticate
  before_action :set_referrer

  def has_coordinates?
    session_coordinates.present?
  end

  def session_coordinates
    @session_coordinates ||= session[:coordinates]
  end

  def has_referrer?
    @referrer.present?
  end

  protected
    def authenticate
      session[:user_id] = User.first.id if params[:login].present?
    end

    def set_referrer
      return unless session[:referral_token].present?

      if user = User.find_by(referral_token: session[:referral_token])
        @referrer = user.name
      end
    end

    def current_user
      @user ||= User.find_by(id: session[:user_id])
    end
end
