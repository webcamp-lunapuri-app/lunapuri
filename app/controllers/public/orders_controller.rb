class Public::OrdersController < ApplicationController
  # before_action :authenticate_client!
  def new
    @order = Order.new
    @deliveries = Delivery.all
  end
  
  def confirm
    @order = Order.new(order_params)
    @order.client_id = current_client.id
    @cart_items = current_client.cart_items
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
    end
  end
  
  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to thanks_orders_path(@order.id)
  end

  def thanks
    # @order_item = OrderItem.new(order_item_params)
    # @cart_items = CartItem.where(client_id: current_client.id).order(created_at: :desc)
    # @order_item.client_id = current_client.id
    # @cart_item = CartItem.find(params[:id])
    # @order_item.product_id = @cart_item.product_id
    # @order_item.purchase_price = @cart_item.product_id.price * 1.1
    # @order_item.count = @cart_item.count
    # @order_item.save
    
    # redirect_to request.referer
  end

  def index
  end

  def show
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
  
  def order_item_params
    params.require(:order_item).permit(
      :order_id, :product_id,
      :purchase_price, :count,
      :production_status
      )
  end
end
