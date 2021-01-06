class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @new_product = Product.new
    @genres = Genre.all
  end

  def create
    # @product = Product.find(params[:id])
    @new_product = Product.new
    @new_product.save
    redirect_to admin_products_path
  end

  def show
  end

  def edit
  end

  def update
  end

  private
  def product_params
    params.require(:product).permit(:name, :genre_id, :image, :introduction, :price, :is_sales_status)
  end

end
