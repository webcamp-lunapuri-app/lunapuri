class Public::ClientsController < ApplicationController

  def show
    @client = current_client
  end

  def edit
    @client = current_client
  end

  def update
    @client = current_client
    @client.update(client_params)
    redirect_to client_path(current_client)
  end

  def unsubscribe
    @client = current_client
  end

  def withdraw
    @client = current_client
    @client.update(is_unsubscribe_flag: "Invalid") #updateで登録情報をInvalidに変更
    reset_session #sessionIDのresetを行う
    redirect_to root_path #指定されたrootへのpath
  end

  def client_params
    params.require(:client).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :tel, :email, :is_unsubscribe_flag)
  end
end
