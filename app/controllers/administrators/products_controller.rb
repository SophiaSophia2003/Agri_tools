# app/controllers/admin/products_controller.rb

class Administrators::ProductsController < ApplicationController
  before_action :authenticate_administrator!
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to administrators_product_path(@product), notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to administrators_product_path(@product), notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to administrators_products_path, notice: 'Product was successfully deleted.'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
     params.require(:product).permit(:name, :price,:stock_quantity, :description, :thumbnail, :category_id, product_images_attributes: [:image])
  end
end
