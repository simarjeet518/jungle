class Admin::DashboardController < ApplicationController
  def show
  @categories = Category.all
  @products = @categories.product
  @product_total = Product.all.count
  end
end
