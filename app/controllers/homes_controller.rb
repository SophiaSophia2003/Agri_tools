class HomesController < ApplicationController
  def index
      new_start_date = Date.parse((DateTime.now - 3.days).to_s).beginning_of_day
      new_end_date = Date.parse((DateTime.now).to_s).end_of_day
      @new_products = Product.where(product_type: "NEW").where(created_at: new_start_date..new_end_date).limit(6)

      recent_start_date = Date.parse((DateTime.now - 3.days).to_s).beginning_of_day
      recent_end_date = Date.parse((DateTime.now).to_s).end_of_day

      @recent_products = Product.where(product_type: "RECENTLY").where(updated_at: recent_start_date..recent_end_date).limit(6)
      start_date = Date.parse((DateTime.now).to_s).beginning_of_day
      end_date = Date.parse((DateTime.now ).to_s).end_of_day
      @sale_products = Product.where(product_type: "SALE").where(updated_at: start_date..end_date).limit(6)
      add_breadcrumb 'Home', :root_path
      add_breadcrumb @category.name, category_path(@category) if @category
  end
end