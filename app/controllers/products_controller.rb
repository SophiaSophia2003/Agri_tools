class ProductsController < ApplicationController

	def index
		@cart_item = CartItem.new
      if (params[:query].present? && params[:category].present?)
      @products = Category.find_by(id: params[:category]).products
      @products = @products.where('name LIKE ?', "%#{params[:query]}%")
		elsif params[:query].present?
      @products = Product.where('name LIKE ?', "%#{params[:query]}%")
    elsif params[:category].present?
    	@products = Category.where("name = ? ", "#{params[:category]}").first.products
    elsif params[:category_name].present?
      @products = Category.where("id = ?", "#{params[:category_name]}").first.products
    else
      @products = Product.all
    end
	end

  def show
     flash[:notice] = 'Your message here'
    @cart_item = CartItem.new
    @product = Product.find(params[:id])
  end
end