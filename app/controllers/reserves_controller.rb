class ReservesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team, only: [:index, :new]
  before_action :set_message, only: [:index, :new]

  def index
    @programs = @team.programs.order(created_at: "DESC")
  end

  def new
    @customer = Customer.new
    @program = Program.find(params[:program_id])
    @schedules = @program.schedules.order(date: "ASC", start_time: "ASC")
  end

  private
  def set_team
    @team = Team.find(params[:team_id])
  end

  def set_message
    @message = Message.new
    @messages = @team.messages.order(created_at: "DESC").limit(5)
  end
end
