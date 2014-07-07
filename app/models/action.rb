class Action < ActiveRecord::Base
  belongs_to :project, touch: true # necessary to bust cache
  belongs_to :user
  belongs_to :trackable, polymorphic: true

  scope :recent_for, ->(user){
    joins(project: :accesses).
      where('accesses.user_id = ?', user.id).order(id: :desc)
  }

  PER_PAGE = 5
  scope :paginate, ->(page=0) {
    page = (page.to_i || 0)
    limit(PER_PAGE).offset(page * PER_PAGE)
  }
end
