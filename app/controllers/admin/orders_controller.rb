class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
    # @order_items = Order_item.all
  end

  def detail
    @orders = Order.where(client_id: params[:id])
  end

  def show
    @order = Order.find(params[:id])
    # @order_items = Order_item.where(order_id: params[:id])
  end

  def edit
  end

  def update
  end

  private
  def order_params
    params.require(:order).premit(:client_id,:delivery_postal_code, :delivery_address,
    :delivery_name, :delivery_charge, :total_amounts, :payment_methods,:order_status)
  end
end
