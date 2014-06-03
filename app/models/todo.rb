class Todo < ActiveRecord::Base
  belongs_to :project, touch: true
end
