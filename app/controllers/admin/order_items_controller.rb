class Admin::OrderItemsController < ApplicationController
  def update

    @order_item = OrderItem.find(params[:id])
    @order_items = OrderItem.where(order_id: @order_item.order_id)
    @order_item.update(order_item_params)
    @order = Order.find_by(id: @order_item.order_id)

    if @order_item.production_status == "製作中"
      @order.update(order_status: "製作中")
    elsif @order.order_items.where(production_status: "製作完了").count == @order.order_items.count
      @order.update(order_status: "発送準備中")
    end


    redirect_to admin_order_path(@order.id)
  end

  private
  def order_item_params
    params.require(:order_item).permit(:order_id,:product_id,:production_status,:purchase_price, :count)
  end

end
