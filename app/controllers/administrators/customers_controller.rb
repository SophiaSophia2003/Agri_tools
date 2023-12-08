class Administrators::CustomersController < ApplicationController
  before_action :authenticate_administrator!
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = Customer.all
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to administrators_customer_path(@customer), notice: 'Customer was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to administrators_customer_path(@customer), notice: 'Customer was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @customer.destroy
    redirect_to administrators_customers_path, notice: 'Customer was successfully deleted.'
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
    
  end

  def customer_params
    params.require(:customer).permit(:first_name,:last_name, :email, :phone_number)
  end
end