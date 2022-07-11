class SchedulesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_program
  before_action :set_team, only: [:new]
  before_action :set_message, only: [:new]

  def new
    @form = Form::ProgramCollection.new
  end


  def create
    @form = Form::ScheduleCollection.new(schedule_collection_params)
    my_team = Team.where(name: current_user.nickname)
    if @form.save
      redirect_to team_path(my_team.ids), notice: "公演を登録しました"
    else
      flash.now[:alert] = "公演登録に失敗しました"
      render :new
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
  
  def schedule_collection_params
    params.require(:form_schedule_collection).permit(schedules_attributes: [:date, :start_time]).merge(program_id: params[:program_id])
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

end