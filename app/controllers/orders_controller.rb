# app/controllers/orders_controller.rb

class OrdersController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def new
    @cart = current_cart
    @order = current_customer.orders.build
    @order.cart_items.build
    # Add logic to populate products or choose products for the order
  end

  def index
    @orders = Order.where(customer_id: current_customer.id)
    
  end

  def create
    @order = current_customer.orders.build
    load_cart_items_to_order

    if @order.save
    intent = Stripe::PaymentIntent.create(
      amount: @order.total_amount,
      currency: 'usd'
    )

    render json: { clientSecret: intent.client_secret }
      # redirect_to @order, notice: 'Order was successfully created.'
      # Clear the cart after the order is placed
      clear_session_cart
    else
      render :new
    end
  end

  def confirm_payment
    intent = Stripe::PaymentIntent.retrieve(params[:payment_intent_id])
    order_id = intent.metadata.order_id
    render json: { status: 'success' }
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:payment_method,:order_date,:status,:total_amount,:customer_id, cart_items_attributes: [:product_id, :quantity])
  end

  def load_cart_items_to_order
    cart_items = fetch_cart_items
    cart_items.each do |cart_item|
      @order.cart_items.build(product: cart_item.product, quantity: cart_item.quantity)
    end
  end

  def clear_session_cart
    session[:cart] = nil
    session[:cart_id] = nil
    session.delete(:cart_id)
  end

  def fetch_cart_items
    session[:cart] || []
  end  

  def calculate_order_total(order_id)
    # Implement your logic to calculate the order total based on the order_id
    # ...

    # For example, let's say the order total is $100
    10000
  end
end

