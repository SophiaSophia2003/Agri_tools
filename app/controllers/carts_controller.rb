class CartsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_cart_item, only: [:update_quantity, :destroy]

  def show
    @cart = current_customer.cart
  end

  def add_to_cart
    @product = Product.find(params[:product_id])
    @cart_item = current_cart.cart_items.build(product: @product, quantity: params[:cart_item][:quantity])

    if @cart_item.save
      redirect_to @product, notice: 'Product added to cart successfully.'
    else
      redirect_to @product, alert: 'Failed to add product to cart.'
    end
  end

  def update_quantity
    new_quantity = params[:cart_item][:quantity].to_i
    if new_quantity > 0 && @cart_item.update(quantity: new_quantity)
      redirect_to cart_path, notice: 'Cart item quantity updated successfully.'
    else
      redirect_to cart_path, alert: 'Failed to update cart item quantity.'
    end
    
  end


  def update

  end  

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
    # @cart_item = current_cart.cart_items.find(params[:id])
  end  


end