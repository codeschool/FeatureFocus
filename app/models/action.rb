class Action < ActiveRecord::Base

  belongs_to :user

  def target_title
    something = target.constantize.find(target_id)
    something.title
  end
end
