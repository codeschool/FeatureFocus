module MessageSubscriptionsHelper
  def list_subscribers(subscribers)
    if subscribers.any?
      subscribers.map(&:name).join(', ')
    else
      'No participants'
    end
  end
end
