class MessageSubscription < ActiveRecord::Base
  belongs_to :message
  belongs_to :subscriber, class_name: 'User'
end
