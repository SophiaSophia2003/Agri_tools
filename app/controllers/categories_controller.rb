class CategoriesController < ApplicationController

	def index
		@categories = Category.all
		
	end

  def show
    @category = Category.find(params[:id])
    @products = Product.joins(:categories).where(categories: {id: @category.id}).page(params[:page]).per(20)
      add_breadcrumb 'Home', :root_path
      add_breadcrumb @category.name, category_path(@category) if @category
  end
end