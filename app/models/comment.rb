class Comment < ActiveRecord::Base
  include Trackable

  belongs_to :message
  belongs_to :user

  has_many :actions, as: :trackable

  delegate :project, to: :message

  scope :recent, -> { order(created_at: :desc).limit(5) }

end
