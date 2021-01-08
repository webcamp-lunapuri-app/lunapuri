class Public::CartItemsController < ApplicationController
  before_action :authenticate_client!
  
  def index
    @cart_items = CartItem.where(client_id: current_client.id).order(created_at: :desc)
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.client_id = current_client.id
    @cart_item.save
    redirect_to cart_items_path
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to request.referer
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to request.referer
  end
  
  def destroy_all
    # current_clientのカート商品のみ全削除したい
    CartItem.destroy_all
    redirect_to request.referer
  end
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:client_id, :product_id, :count)
  end
end