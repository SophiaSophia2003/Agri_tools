# app/controllers/admin/products_controller.rb

class Customer::ProductsController < ApplicationController
  # before_action :authenticate_customer!
  before_action :check_admin_role

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
  end

  private

  def check_admin_role
    redirect_to root_path, alert: 'You are not authorized.' unless current_user.admin?
  end
end
