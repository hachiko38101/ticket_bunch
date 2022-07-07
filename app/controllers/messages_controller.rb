class MessagesController < ApplicationController
  def index
  end

  def create
    @team = Team.find(params[:team_id])
    @message = @team.messages.new(message_params)
    if @message.save
      redirect_to team_path(params[:team_id])
    else
      @messages = @team.messages.includes(:user)
      render :index
    end
  end

private
  def message_params
    params.require(:message).permit(:message, :team_id).merge(user_id: current_user.id)
  end
end