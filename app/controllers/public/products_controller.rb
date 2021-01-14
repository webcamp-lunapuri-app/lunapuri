class Public::ProductsController < ApplicationController
  PER = 8
  def index
    @products = Product.where(is_sales_status: 'true').joins(:genre).where(genres: { is_active: 'true' }).page(params[:page]).per(PER).reverse_order
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end
end