require 'notifications_mailer'

class NewMessageJob
  include SuckerPunch::Job

  def self.async_perform_each(message)
    emails = message.subscribers.map(&:email)
    emails.each do |email|
      new.async.perform(message, email)
    end
  end

  def perform(message, email)
    NotificationsMailer.new_message(message, email).deliver
  end

end
