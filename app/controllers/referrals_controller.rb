class ReferralsController < ApplicationController
  def create
    deal = Deal.find(params[:deal_id])
    deal.referrals.create!(referral_params)
    redirect_to deal
  end

  private
    def referral_params
      params.require(:referral).permit(:referee_email)
    end
end
