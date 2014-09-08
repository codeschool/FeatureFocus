class Action < ActiveRecord::Base
  belongs_to :project, touch: true # necessary to bust cache
  belongs_to :user
  belongs_to :trackable, polymorphic: true

  scope :recent_for, ->(user){
    joins(project: :accesses).
      where('accesses.user_id = ?', user.id).order(id: :desc)
  }

  PER_PAGE = 10
  scope :paginate, ->(current_page=1) {
    current_page = (current_page.to_i || 1)
    page(current_page).per(PER_PAGE)
  }
end
