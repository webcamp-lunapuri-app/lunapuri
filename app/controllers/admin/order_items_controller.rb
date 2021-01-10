class Admin::OrderItemsController < ApplicationController
  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(order_item_params)
    redirect_to admin_order_path(@order_item.id)
  end

  private
  def order_item_params
    params.permit(:product_id,:production_status,:purchase_price, :count)
  end
end
