class User < ActiveRecord::Base
  has_many :owned_projects, foreign_key: 'owner_id', class_name: 'Project'

  has_many :accesses
  has_many :projects, through: :accesses do
    def recent_progress
      order(updated_at: :desc)
    end
  end
end
