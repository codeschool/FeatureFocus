module Trackable
  extend ActiveSupport::Concern

  included do
    has_many :actions, as: :trackable
    after_save :track_action
  end

  protected
    def track_action
      Action.create!(
        project: project,
        user: user,
        trackable: self
      )
    end
end
