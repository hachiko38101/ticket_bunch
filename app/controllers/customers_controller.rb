class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team, only: [:index, :new , :create, :show, :edit, :update]
  before_action :set_message, only: [:index, :new, :create, :show, :edit, :update]
  before_action :set_customer, only: [:show, :destroy, :edit, :update]

  def index
    @customers = @team.customers.order(name_kana: "ASC")
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to "/teams/#{@customer.team.id}/customers"
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @customer.update(customer_update_params)
      redirect_to "/teams/#{@customer.team.id}/customers"
    else
      render "edit"
    end
  end

  def destroy
    if @customer.destroy
      redirect_to "/teams/#{@customer.team.id}/customers"
    else
      render "edit"
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :name_kana, :address, :phone_number, :fax_number, :email, :explanation).merge(team_id: params[:team_id])
  end

  def customer_update_params
    params.require(:customer).permit(:name, :name_kana, :address, :phone_number, :fax_number, :email, :explanation).merge(team_id: params[:team_id])
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

  def set_customer
    @customer = Customer.find(params[:id])
  end

end
