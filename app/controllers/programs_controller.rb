class ProgramsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_program, only: [:show, :edit, :update, :destroy]
  before_action :set_team, only: [:index, :new, :show, :update, :edit, :create]
  before_action :set_message, only: [:index, :new, :show, :update, :edit, :create]

  def index
    @programs = @team.programs.order(created_at: "DESC")
  end

  def new
    @program = Program.new
  end 

  def create
    @program = Program.new(program_params)
    if @program.save
      redirect_to "/teams/#{@program.team.id}/programs/#{@program.id}/schedules/new"
    else
      render "new"
    end
  end

  def edit
  end

  def show
    @schedules = @program.schedules.order(created_at: "ASC")
  end

  def update
    if @program.update(program_update_params)
      redirect_to "/teams/#{@program.team.id}/programs"
    else
      render "edit"
    end
  end

  def destroy
    if @program.destroy
      redirect_to "/teams/#{@program.team.id}/programs"
    else
      render "edit"
    end
  end


  private 

  def program_params
    params.require(:program).permit(:name).merge(team_id: params[:team_id])
  end

  def program_update_params
    params.require(:program).permit(:name)
  end

  def set_program
    @program = Program.find(params[:id])
  end

  def set_team
    @team = Team.find(params[:team_id])
  end

  def set_message
    @message = Message.new
    @messages = @team.messages.order(created_at: "DESC").limit(5)
  end
end