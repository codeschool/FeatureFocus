class ProgressController < ApplicationController
  def show
    # or current_user
    @projects = User.find_by(email: 'member-5@codeschool.com').projects.recent_progress
  end
end
