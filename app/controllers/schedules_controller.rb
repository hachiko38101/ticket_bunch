class SchedulesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_program, only: [:new, :create, :show, :destroy]
  before_action :set_team, only: [:new, :create, :show]
  before_action :set_message, only: [:new, :create, :show]
  before_action :set_schedule, only: [:show, :destroy]
  before_action :set_schedules, only: [:new, :create, :show]

  def new
    @schedule = Schedule.new
  end


  def create
    @schedule = Schedule.new(schedule_params)
    my_team = Team.where(name: current_user.nickname)
    if @schedule.save
      redirect_to new_team_program_schedule_path
    else
      render :new
    end

  end

  def show
  end

  def destroy
    if @schedule.destroy
      redirect_to new_team_program_schedule_path
    else
      render :edit
    end
  end

  private 
  
  def schedule_params
    params.require(:schedule).permit(:date, :start_time, :ticket_number).merge(program_id: params[:program_id])
  end

  def set_program
    @program = Program.find(params[:program_id])
  end

  def set_team
    @team = Team.find(params[:team_id])
  end

  def set_message
    @message = Message.new
    @messages = @team.messages.order(created_at: "DESC").limit(5)
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def set_schedules
    @schedules = @program.schedules.order(date: "ASC", start_time: "ASC")
  end
end