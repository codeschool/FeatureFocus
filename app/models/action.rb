class Action < ActiveRecord::Base

  belongs_to :user

  scope :recent, -> { order(created_at: :desc) }

  def target_title
    parent = target_object
    parent.body
  end

  def target_object
    target.constantize.find(target_id)
  end

  def parent_object
    if target_object.respond_to?(:commentable)
      target_object.commentable
    else
      target_object.project
    end
  end
end
