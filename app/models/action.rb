class Action < ActiveRecord::Base
  belongs_to :project
  belongs_to :user


  scope :recent_for, ->(user){
    joins(project: :accesses).
      where('accesses.user_id = ?', user.id).order(created_at: :desc)
  }

  PER_PAGE = 5
  scope :paginate, ->(page=0) {
    page = (page.to_i || 0)
    limit(PER_PAGE).offset(page * PER_PAGE)
  }
end
