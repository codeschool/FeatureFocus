class ProjectsController < ApplicationController
  def index
    @projects = Project.all_for(current_user)
  end

  def show
    @project = Project.find(params[:id])
    @comments = @project.comments
  end
end
