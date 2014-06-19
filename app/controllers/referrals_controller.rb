class ReferralsController < ApplicationController

  def show
    referral = Referral.find_by(token: params[:id])

    @deal = referral.deal
    @referral_id = referral.id

    render 'deals/show'
  end

  def create
    deal = Deal.find(params[:deal_id])
    referral = deal.referrals.create!(referral_params)

    ReferralNotificationJob.async_perform(referral)

    redirect_to deals_path, alert: 'Referral sent!'
  end

  private
    def referral_params
      params.require(:referral).permit(:referee_email).merge(
        referrer: current_user
      )
    end
end
