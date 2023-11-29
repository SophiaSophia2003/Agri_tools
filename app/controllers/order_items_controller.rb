# app/controllers/cart_items_controller.rb

class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    @cart = current_user.cart || current_user.create_cart
    @cart_item = @cart.cart_items.build(product_id: params[:product_id], quantity: 1)

    if @cart_item.save
      redirect_to products_path, notice: 'Product added to cart.'
    else
      redirect_to products_path, alert: 'Failed to add product to cart.'
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(quantity: params[:quantity])
    redirect_to cart_path, notice: 'Cart updated.'
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path, notice: 'Product removed from cart.'
  end
end
