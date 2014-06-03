class Forward < ActiveRecord::Base
  belongs_to :project, touch: true
end
