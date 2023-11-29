class ProductsController < ApplicationController

	def index
		@cart_item = CartItem.new
		if params[:query].present?
      @products = Product.where('name LIKE ?', "%#{params[:query]}%")
    elsif params[:category].present?
    	@products = Category.find_by(name: params[:category]).products
    else
      @products = Product.all
    end
		# @products = if params[:category].present?
    #   Category.find_by(name: params[:category]).products
    # else
    #   Product.all
    # end
		
	end

  def show
    @product = Product.find(params[:id])
  end
end