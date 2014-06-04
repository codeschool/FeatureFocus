class Comment < ActiveRecord::Base
  include Trackable

  belongs_to :commentable, polymorphic: true
  belongs_to :user

  def title
    commentable.title
  end
end
