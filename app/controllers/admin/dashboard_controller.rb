class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USER_NAME'], password: ENV['ADMIN_PASSWORD']
  
  def show
  @categories = Category.all
  @products = @categories.product
  @product_total = Product.all.count
  end
end
