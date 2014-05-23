class User < ActiveRecord::Base
  has_many :owned_projects, foreign_key: 'owner_id', class_name: 'Project'
end
