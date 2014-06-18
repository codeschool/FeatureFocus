class ReferralMailer < ActionMailer::Base
  default from: "from@example.com"

  def new_deal(recipient, deal_title, deal_url_with_token)
    @deal_title = deal_title
    @deal_url = deal_url_with_token

    mail to: recipient
  end
end
