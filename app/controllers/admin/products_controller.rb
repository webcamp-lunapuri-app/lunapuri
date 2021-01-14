class Admin::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page])
  end

  def new
    @new_product = Product.new
    @genres = Genre.all
  end

  def create
    @new_product = Product.new(product_params)
    @new_product.save
    redirect_to admin_product_path(@new_product.id)
  end

  def show
    @product = Product.find(params[:id])

  end

  def edit
     @product = Product.find(params[:id])
     @genres = Genre.all

  end

  def update
     @product = Product.find(params[:id])
     @product.update(product_params)
     redirect_to admin_product_path(@product.id)

  end

  private
  def product_params
    params.require(:product).permit(:name, :genre_id, :image, :introduction, :price, :is_sales_status)
  end

end
