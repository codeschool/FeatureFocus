class ProgressController < ApplicationController

  def show
    @actions = Action.recent_for(current_user).paginate(params[:page])
  end

end
