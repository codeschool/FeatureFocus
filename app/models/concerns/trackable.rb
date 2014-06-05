module Trackable
  extend ActiveSupport::Concern

  included do
    after_save :track_action
  end

  protected
    def track_action
      Action.create!(
        project: project,
        user: user,
        target_model: self.class.to_s
      )
    end

end
