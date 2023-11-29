# app/controllers/cart_items_controller.rb

class CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def create
    options = {product_id: params[:cart_item][:product_id],quantity: 1}
    @cart = current_customer.cart || current_customer.create_cart(options)
    @cart_item = @cart.cart_items.build(product_id: params[:cart_item][:product_id], quantity: 1)
    if @cart_item.save
      redirect_to products_path, notice: 'Product added to cart.'
    else
      redirect_to products_path, alert: 'Failed to add product to cart.'
    end
  end

  def update
    @cart_item = CardItem.find(params[:id])
    @cart_item.update(quantity: params[:quantity])
    redirect_to cart_path, notice: 'Cart updated.'
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to carts_path, notice: 'Item removed from cart.'
  end
end
