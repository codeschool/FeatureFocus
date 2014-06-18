class ReferralsController < ApplicationController
  def create
    deal = Deal.find(params[:deal_id])
    referral = deal.referrals.create!(referral_params)

    ReferralNotificationJob.async_perform(referral)

    redirect_to deals_path, alert: 'Referral sent!'
  end

  private
    def referral_params
      params.require(:referral).permit(:referee_email)
    end
end
