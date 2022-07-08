class ProgramsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_program, only: [:show,:edit, :update, :destroy]

  def index
    @message = Message.new
    @team = Team.find(params[:team_id])
    @messages = @team.messages.order(created_at: "DESC").limit(5)
    @programs = @team.programs.order(created_at: "DESC").limit(15)
  end

  def new
    @program = Program.new
    1.times { @program.schedules.build }
  end 

  def create
    @program = Program.new(program_params)
    @program.user_id = current_user.id
    if @program.save
      redirect_to program_path(@program.id)
    else
      render "new"
    end
  end

  def edit
    @schedule = Schedule.new
  end

  def update
    if @program.update(program_update_params)
      redirect_to team_path(params[:team_id])
    else
      render "edit"
    end
  end

  def destroy
    if @program.destroy
      redirect_to team_path(params[:team_id])
    else
      render "edit"
    end
  end


  private 

  def program_params
    params.require(:program).permit(:name, schedules_attributes: [:date, :start_time])
  end

  def program_update_params
    params.require(:program).permit(:name, schedules_attributes: [:id, :date, :start_time])
  end

  def set_program
    @program = Program.find(params[:id])
  end
end