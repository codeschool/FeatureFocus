class ProgressController < ApplicationController
  def show
    actions = Action.recent_for(current_user).paginate(params[:page])
    @timeline_actions = timeline_format(actions)

    respond_to do |format|
      format.html
      format.js
    end
  end


  private
    def timeline_format(actions)
      ordered = []

      actions.each do |action|
        current_project = action.project.title
        if ordered.last && ordered.last[:project_title].presence == current_project
          ordered.last[:actions] << action
        else
          ordered << { project_title: current_project, actions: [action] }
        end
      end

      ordered
    end
end
