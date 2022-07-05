class TeamsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @user = current_user
  end

  def new
      @user = current_user
      @team = Team.new
      if @user.teams.present？
        redirect_to team_path(@team.id)
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
  end

private

  def team_params
    params.require(:team).permit(:name)
  end
end
