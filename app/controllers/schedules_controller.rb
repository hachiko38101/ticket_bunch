class SchedulesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  def create
    @program = Program.find(params[:program_id])
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to edit_program_path(params[:program_id])
    else
      render "programs/edit"
    end

  end

  def destroy
    @program = Program.find(params[:program_id])
    @schedule = Schedule.find(params[:id])
    if @schedule.destroy
      redirect_to edit_program_path(params[:program_id])
    else
      render "programs/edit"
    end
  end

  private 
  
  def schedule_params
    params.require(:schedule).permit(:date, :start_time).merge(program_id: params[:program_id])
  end

end