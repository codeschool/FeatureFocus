class ProgressController < ApplicationController
  def show
    @projects = current_user.projects.recent
  end
end
