class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @deliveries = current_client.deliveries.order(created_at: :desc)
  end

  def confirm
    @order = Order.new(order_params)
    @order.client_id = current_client.id
    @cart_items = current_client.cart_items.order(created_at: :desc)
    if params[:order][:address_option] == "0"
      @order.delivery_postal_code = current_client.postal_code
      @order.delivery_address = current_client.address
      @order.delivery_name = current_client.full_name
    elsif params[:order][:address_option] == "1"
      @delivery = Delivery.find_by(id: @order.delivery_id)
      @order.delivery_postal_code = @delivery.postal_code
      @order.delivery_address = @delivery.address
      @order.delivery_name = @delivery.name
    elsif params[:order][:address_option] == "2"
      @order.delivery_postal_code = params[:order][:delivery_postal_code]
      @order.delivery_address = params[:order][:delivery_address]
      @order.delivery_name = params[:order][:delivery_name]
      @new_delivery = Delivery.new
      @new_delivery.postal_code = params[:order][:delivery_postal_code]
      @new_delivery.address = params[:order][:delivery_address]
      @new_delivery.name = params[:order][:delivery_name]
    end
  end

  def create
    @order = Order.new(order_params)
    @order.save
    @cart_items = current_client.cart_items.all
      @cart_items.each do |cart_item|
        @order_items = @order.order_items.new
        @order_items.product_id = cart_item.product_id
        @order_items.purchase_price = cart_item.product.price * 1.1
        @order_items.count = cart_item.count
        @order_items.save
        current_client.cart_items.destroy_all
      end
  if params[:order][:address_option] == "2"
    @new_delivery = Delivery.new
    @new_delivery.postal_code = params[:order][:delivery_postal_code]
    @new_delivery.address = params[:order][:delivery_address]
    @new_delivery.name = params[:order][:delivery_name]
    @new_delivery.client_id = current_client.id
    @new_delivery.save
  end
    redirect_to thanks_orders_path(@order.id)
  end

  def thanks
  end

  def index
    @orders = current_client.orders.all.order(created_at: :desc)
    @orders.joins(:order_items)
    @products = Product.all.includes(:order_items)
  end

  def show
    @order = Order.find(params[:id])
    @products = Product.all.includes(:order_items)
  end

  private
  def order_params
    params.require(:order).permit(
      :client_id, :delivery_postal_code,
      :delivery_address, :delivery_name,
      :delivery_charge, :total_amounts,
      :payment_methods, :order_status,
      :delivery_id
      )
  end
end
