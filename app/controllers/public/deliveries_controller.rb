class Public::DeliveriesController < ApplicationController
  def index
    @delivery = Delivery.new
    @client = current_client
    @deliveries = @client.deliveries.page(params[:page]).reverse_order
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.save
    redirect_back(fallback_location: root_path)
  end

  def edit
    @delivery = Delivery.find(params[:id])
    @client = current_client
  end

  def update
    @delivery = Delivery.find(params[:id])
    @delivery.update(delivery_params)
    redirect_to deliveries_path
  end

  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def delivery_params
    params.require(:delivery).permit(:client_id, :postal_code, :address, :name)
  end
end
