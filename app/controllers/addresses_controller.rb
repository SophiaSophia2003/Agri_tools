class AddressesController < ApplicationController
  before_action :set_customer! # Ensure the customer is signed in

  def index
    @addresses = @customer.addresses
  end

  def new
    @address = @customer.addresses.build
  end

  def create
    @address = @customer.addresses.build(address_params)
    if @address.save
      redirect_to customer_path(@customer), notice: 'Address was successfully created.'
    else
      render :new
    end
  end

  def edit
    @address = @customer.addresses.find(params[:id])
  end

  def update
    @address = @customer.addresses.find(params[:id])

    if @address.update(address_params)
      redirect_to customer_addresses_path(@customer), notice: 'Address was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @address = @customer.addresses.find(params[:id])
    @address.destroy
    redirect_to customer_addresses_path(@customer), notice: 'Address was successfully destroyed.'
  end

  def set_customer!
    @customer = Customer.find_by(id: params[:customer_id])
    
  end

  private

  def address_params
    params.require(:address).permit(:customer_id,:street_address,:address_type, :city, :state, :zip_code, :country)
  end
end
