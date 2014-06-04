module Trackable
  extend ActiveSupport::Concern

  included do
    after_save :add_action
  end

  def add_action
    name = (self.created_at == self.updated_at) ? 'created' : 'updated'

    Action.create!(
      user_id: self.user.id,
      name: name,
      target: self.class.to_s,
      target_id: self.id
    )
  end
end
