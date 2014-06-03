class Attachment < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true, touch: true
end
