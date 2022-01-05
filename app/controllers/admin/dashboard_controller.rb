class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['AUTH_USERNAME'], password: ENV['AUTH_PASSWORD']
  def show
    @product_count = Product.count
    @category_count = Category.count
  end
end
