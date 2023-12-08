# app/controllers/checkout_controller.rb

class CheckoutsController < ApplicationController
  before_action :authenticate_customer!

  def show
    @cart = current_cart
    @order = current_customer.orders.build
    @gst_rate = Province.find_by(@current_customer.province_id).gst_rate
    @pst_rate = Province.find_by(@current_customer.province_id).pst_rate
    @hst_rate = Province.find_by(@current_customer.province_id).hst_rate
    load_cart_items_to_order
  end

  def process_payment
    # Implement payment processing logic here
    # For simplicity, we'll assume a successful payment
    @cart = current_cart
    @order = current_customer.orders.build(order_params)
    # @order = current_customer.orders.build(order_params)

    if @order.save
      clear_cart
      redirect_to order_path(@order), notice: 'Order was successfully placed.'
    else
      render :show
    end
  end

  private

  def load_cart_items_to_order
    cart_items = fetch_cart_items
    cart_items.each do |cart_item|
      @order.cart_items.build(product: cart_item.product, quantity: cart_item.quantity)
    end
  end

  def fetch_cart_items
    session[:cart] || []
  end

  def clear_cart
    session[:cart] = nil
  end

  def order_params
    params.require(:order).permit(:status,:total_amount, cart_items_attributes: [:product_id, :quantity])
  end
end
