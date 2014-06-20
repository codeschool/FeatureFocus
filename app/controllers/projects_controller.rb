class ProjectsController < ApplicationController
  def index
    @projects = Project.all # TODO: change this to user access.
  end

  def show
    @project = Project.find(params[:id])
    @comments = @project.comments
  end
end
