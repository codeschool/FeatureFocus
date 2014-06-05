class NotificationsMailer < ActionMailer::Base
  default from: "from@example.com"

  def new_message(message, recipient)
    @body = message.body
    mail subject: 'A new message was posted', to: recipient
  end
end
