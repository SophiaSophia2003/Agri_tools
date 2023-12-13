class CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
    @province = Province.find_by(@customer.province_id).name
    @addresses = @customer.addresses
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if params[:customer][:province_id].present?
      @customer.update_columns(province_id: params[:customer][:province_id].to_i)
    end
    if @customer.update(customer_params)
      redirect_to customer_path, notice: 'Account updated successfully.'
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name,:last_name, :email, :password, :password_confirmation,:province_id)
  end
end