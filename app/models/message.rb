class Message < ActiveRecord::Base
  include Trackable

  belongs_to :user
  belongs_to :project, touch: true
  has_many :comments, dependent: :destroy

  has_many :message_subscriptions, dependent: :destroy
  has_many :subscribers, through: :message_subscriptions
end
