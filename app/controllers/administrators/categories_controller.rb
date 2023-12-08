# app/controllers/admin/categorys_controller.rb

class Administrators::CategoriesController < ApplicationController
  before_action :authenticate_administrator!
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to administrators_categories_path(@category), notice: 'category was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to administrators_categories_path(@category), notice: 'category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to administrators_categories_path, notice: 'category was successfully deleted.'
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
     params.require(:category).permit(:name)
  end
end
