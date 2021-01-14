class Admin::ClientsController < ApplicationController
  def index
    @clients = Client.page(params[:page])
  end

  def show
    @client = Client.find(params[:id])
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    @client.update(client_params)
    redirect_to admin_client_path(@client.id)
  end

  private
  def client_params
    params.require(:client).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
      :email, :encrypted_password, :postal_code, :address, :tel, :is_unsubscribe_flag)
  end
end
