class Public::ProductsController < ApplicationController
  PER = 8
  def index
    @products = Product.page(params[:page]).per(PER).order(created_at: :desc)
  end

  def show
    @product = Product.find(params[:id])
  end
end