class Admin::ClientsController < ApplicationController
  def index
    @clients = Client.all
  end

  def show
    @client = client.find(params[:id])
  end

  def edit
  end

  def update
  end
  
  private
  def client_params
    params.require(:client).permit()
end
