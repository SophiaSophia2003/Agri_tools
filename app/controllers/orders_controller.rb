# app/controllers/orders_controller.rb
class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @orders = current_customer.orders
  end

  def show
    @order = current_customer.orders.find(params[:id])
  end

  def new
    @order = current_customer.build_order
    # Add logic to populate @order with line items or products
  end

  def create
    @order = current_customer.build_order(order_params)
    if @order.save
      # Handle successful order creation (e.g., redirect to order confirmation)
      redirect_to order_path(@order), notice: 'Order was successfully created.'
    else
      render :new
    end
  end

  # Add more actions as needed (e.g., update, cancel)

  private

  def order_params
    # Define the permitted parameters for creating an order
    params.require(:order).permit(:address, :payment_method, line_items_attributes: [:product_id, :quantity])
  end
end
