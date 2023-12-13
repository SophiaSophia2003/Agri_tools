# app/controllers/admin/orders_controller.rb

class Administrators::OrdersController < ApplicationController
  before_action :authenticate_administrator!
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.order(created_at: :desc).page(params[:page]).per(20)
  end

  def show
  end

  def new
    @order = Order.new
  end

  def edit_status
    @order = Order.find(params[:id])
  end

  def update_status
    @order = Order.find(params[:id])
    if @order.update(update_order_params)
      redirect_to administrators_orders_path, notice: 'Order status updated successfully.'
    else
      render :edit_status
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def update_order_params
    params.require(:order).permit(:status)
  end  

  def order_params
     params.require(:order).permit(:name, :price,:stock_quantity, :description, :thumbnail, :category_id, order_images_attributes: [:image])
  end
end
