class MessagesController < ApplicationController

  before_action :set_project

  def create
    message = @project.messages.create!(message_params.merge(user: current_user))

    NewMessageJob.async_perform_each(message)

    redirect_to @project
  end

  private
    def set_project
      @project = Project.find(params[:project_id])
    end

    def message_params
      params.require(:message).permit(:body, { subscriber_ids: [] })
    end
end
