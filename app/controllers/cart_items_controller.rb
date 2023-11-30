# app/controllers/cart_items_controller.rb

class CartItemsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_cart_item, only: [:update_quantity, :destroy]

  def create
    options = {product_id: params[:cart_item][:product_id],quantity: params[:cart_item][:quantity] || 1}
    @cart = current_customer.cart || current_customer.create_cart(options)
    @cart_item = @cart.cart_items.build(options)
    if @cart_item.save
      redirect_to products_path, notice: 'Product added to cart.'
    else
      redirect_to products_path, alert: 'Failed to add product to cart.'
    end
  end

  def update
    new_quantity = params[:quantity].to_i

    if new_quantity > 0 && @cart_item.update(quantity: new_quantity)
      redirect_to cart_path, notice: 'Cart item quantity updated successfully.'
    else
      redirect_to cart_path, alert: 'Failed to update cart item quantity.'
    end
    redirect_to cart_path, notice: 'Cart updated.'
  end

  def destroy
    @cart_item.destroy
    redirect_to cart_path, notice: 'Item removed from cart.'
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
    # @cart_item = current_cart.cart_items.find(params[:id]) || CartItem.find(params[:id])
  end
end
