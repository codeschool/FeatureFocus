class MessagesController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    message = @project.messages.create!(message_params.merge(user: current_user))

    NewMessageJob.async_perform_each(message)

    redirect_to @project
  end

  private
    def message_params
      params.require(:message).permit(:body, { subscriber_ids: [] })
    end
end

