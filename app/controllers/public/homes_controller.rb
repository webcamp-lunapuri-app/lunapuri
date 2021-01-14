class Public::HomesController < ApplicationController
  def top
    @products = Product.where(is_sales_status: 'true').joins(:genre).where(genres: { is_active: 'true' }).reverse_order
  end

  def about
  end
end
