class Admin::DashboardController < ApplicationController
  def show
  @categories_count = Category.all.count
  @categories = Category.all

  @each_category_products_count = @categories.map {
    |item|
   item.products.count
  }
  @products_total_count = Product.all.count
  end
end
