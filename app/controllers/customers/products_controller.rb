# app/controllers/admin/products_controller.rb

class Customer::ProductsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_category

  def index
    @cart_item = CartItem.new
      if (params[:query].present? && params[:category].present?)
      @products = Category.find_by(id: params[:category]).products
      @products = @products.where('name LIKE ?', "%#{params[:query]}%").page(params[:page]).per(3)
    elsif params[:query].present?
      @products = Product.where('name LIKE ?', "%#{params[:query]}%").page(params[:page]).per(3)
    elsif params[:category].present?
      @products = Category.where("name = ? ", "#{params[:category]}").first.products.page(params[:page]).per(3)
    elsif params[:category_name].present?
      @products = Category.where("id = ?", "#{params[:category_name]}").first.products.page(params[:page]).per(3)
    elsif params[:product_type].present?
      @products = Product.where(product_type: params[:product_type]).page(params[:page]).per(3)
    else
      @products = Product.page(params[:page]).per(3)
    end
      add_breadcrumb 'Home', :root_path
      add_breadcrumb 'Products'  
  end

  def show
    add_breadcrumb 'Home', :root_path
    add_breadcrumb @product.categories.map{ |c| link_to(c.name,administrators_category_path(c))}.join(", "), category_path(@category) if @product.categories
    add_breadcrumb 'Products', product_index_path
    add_breadcrumb @product.name
  end

  private

  def set_category
    @category = Category.find(params[:category_id]) if params[:category_id]
  end
end
