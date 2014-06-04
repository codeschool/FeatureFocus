class Todo < ActiveRecord::Base
  include Trackable

  belongs_to :project, touch: true
  belongs_to :user
end
