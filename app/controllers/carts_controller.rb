class CartsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_cart_item, only: [:update_quantity, :destroy]

  def show
    @cart = current_cart
  end

  def create
    product = Product.find(params[:cart][:product_id])
    current_cart.add_product(product)
    redirect_to cart_path
    # @cart_item = current_cart.cart_items.build(product: @product,quantity: params[:cart_item][:quantity] || 1)

    # if @cart_item.save
      # redirect_to @product, notice: 'Product added to cart successfully.'
    # else
      # redirect_to @product, alert: 'Failed to add product to cart.'
    # end
  end

    #   options = {product_id: params[:cart_item][:product_id],quantity: params[:cart_item][:quantity] || 1}
    # @cart = current_customer.cart || current_customer.create_cart(options)
    # @cart_item = @cart.cart_items.build(options)
    # if @cart_item.save
    #       # Ensure that session[:cart] is an array
    # # session[:cart] ||= []

    # # session[:cart] << { product_id: product.id, quantity: 1 }
    #   redirect_to products_path, notice: 'Product added to cart.'
    # else
    #   redirect_to products_path, alert: 'Failed to add product to cart.'
    # end

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