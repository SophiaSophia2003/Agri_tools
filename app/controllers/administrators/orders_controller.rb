# app/controllers/admin/orders_controller.rb

class Administrators::OrdersController < ApplicationController
  before_action :authenticate_administrator!
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def update
    if @order.update(order_params)
      redirect_to administrators_order_path(@order), notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to administrators_orders_path, notice: 'order was successfully deleted.'
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
     params.require(:order).permit(:name, :price,:stock_quantity, :description, :thumbnail, :category_id, order_images_attributes: [:image])
  end
end
