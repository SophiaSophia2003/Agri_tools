class CartsController < ApplicationController
  before_action :authenticate_customer!

  def show
    @cart = current_customer.cart
  end
end