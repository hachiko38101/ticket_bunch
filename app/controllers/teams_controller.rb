class TeamsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    if user_signed_in?
      user_top
    end
    @user = current_user
  end

  def new
    @user = current_user
    @team = Team.new
    if Team.exists?(name: @user.nickname)
      user_top
    end
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to team_path(@team.id)
    else
      redirect_to new_team_path
    end
  end

  def show
    @message = Message.new
    @team = Team.find(params[:id])
    @messages = @team.messages.order(created_at: "DESC").limit(5)
  end

private

  def team_params
    params.require(:team).permit(:name, :user_id)
  end

  def user_top
    my_team = Team.where(name: current_user.nickname)
    redirect_to team_path(my_team.ids)
  end

end