class ProductsController < ApplicationController
  include ApplicationHelper

  before_action :set_category


	def index
    # @cart_item = CartItem.new
		@cart = Cart.new
    if (params[:query].present? && params[:category].present?)
      # @products = Category.find_by(id: params[:category]).products
      @products = Product.joins(:categories).where(categories: {name: params[:category]}).where('products.name LIKE ?', "%#{params[:query]}%").page(params[:page]).per(20)
    elsif (params[:query].present? && params[:category_name].present?)
      @products = Product.joins(:categories).where('products.name LIKE ?', "%#{params[:query]}%").where(categories: {id: params[:category_name]}).page(params[:page]).per(20)
		elsif params[:query].present?
      @products = Product.where('products.name LIKE ?', "%#{params[:query]}%").page(params[:page]).per(20)
    elsif params[:category].present?
    	@products = Product.joins(:categories).where(categories: {name: params[:category]}).page(params[:page]).per(20)
    elsif params[:category_name].present?
      @products = Product.joins(:categories).where(categories: {id: params[:category_name]}).page(params[:page]).per(20)
    elsif params[:product_type].present?
      if params[:product_type] == "NEW"
        start_date = Date.parse((DateTime.now - 3.days).to_s).beginning_of_day
        end_date = Date.parse((DateTime.now).to_s).end_of_day
        @products = Product.where(product_type: params[:product_type]).where(created_at: start_date..end_date).page(params[:page]).per(20)
      elsif params[:product_type] == "RECENTLY"
        start_date = Date.parse((DateTime.now - 3.days).to_s).beginning_of_day
        end_date = Date.parse((DateTime.now).to_s).end_of_day

        @products = Product.where(product_type: params[:product_type]).where(updated_at: start_date..end_date).page(params[:page]).per(20)
      elsif params[:product_type] == "SALE"
        start_date = Date.parse((DateTime.now).to_s).beginning_of_day
        end_date = Date.parse((DateTime.now ).to_s).end_of_day
        @products = Product.where(product_type: params[:product_type]).where(updated_at: start_date..end_date).page(params[:page]).per(20)
      end
      # @products = Product.where(product_type: params[:product_type]).page(params[:page]).per(20)
    else
      @products = Product.page(params[:page]).per(20)
    end
      add_breadcrumb 'Home', :root_path

      # add_breadcrumb @category.name, category_path(@category) if @category
      add_breadcrumb 'Products'  
	end

  def show
    @cart_item = CartItem.new
    @product = Product.find(params[:id])
    add_breadcrumb 'Home', :root_path
    if @product.categories.present?
    add_breadcrumb @product.categories.first.name ,category_path(@product.categories.first) if @product.categories
  end
    add_breadcrumb 'Products', products_path
    add_breadcrumb @product.name,product_path(@product) if @product
  end

  def new
    @product = Product.new
    @product.product_images.build # Build an empty product image association for the new product
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price,:stock_quantity, :description, :thumbnail, :category_id, product_images_attributes: [:image])
  end
  def set_category
    @category = Category.find(params[:category_id]) if params[:category_id]
  end  
end