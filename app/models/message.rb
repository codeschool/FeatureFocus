class Message < ActiveRecord::Base
  belongs_to :project, touch: true
  has_many :comments, as: :commentable
end
