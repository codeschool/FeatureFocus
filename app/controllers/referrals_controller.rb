class ReferralsController < ApplicationController

  skip_before_action :set_referrer

  def new
    session[:referral_token] = params[:token]
    redirect_to root_path
  end
end

