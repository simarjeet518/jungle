class Admin::DashboardController < ApplicationController
  def show
  @category_count = Category.all.count
  @category = Category.all

  @Each_category_product_count = @category.map {
    |item|
   item.products.count
  }
  @product_total_count = Product.all.count
  end
end
