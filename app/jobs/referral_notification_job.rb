class ReferralNotificationJob
  include SuckerPunch::Job

  def self.async_perform(referral)
    recipient = referral.referee_email
    deal_title = referral.deal.title
    deal_url_with_token = '/banana/123'

    new.async.perform(recipient, deal_title, deal_url_with_token)
  end

  def perform(recipient, deal_title, deal_url_with_token)
    ReferralMailer.new_deal(recipient, deal_title, deal_url_with_token).deliver
  end
end

