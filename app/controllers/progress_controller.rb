class ProgressController < ApplicationController
  def show
    @projects = current_user.projects
  end
end
