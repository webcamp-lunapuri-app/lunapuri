class Public::CartItemsController < ApplicationController
  before_action :authenticate_client!
  
  def index
    @cart_items = CartItem.where(client_id: current_client.id)
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.client_id = current_client.id
    @cart_item.save
    redirect_to cart_items_path
  end
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:client_id, :product_id, :count)
  end
end