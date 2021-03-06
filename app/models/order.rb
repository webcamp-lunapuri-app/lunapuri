class Order < ApplicationRecord
  belongs_to :client, foreign_key: 'client_id'
  has_many :order_items, dependent: :destroy
  attr_accessor :delivery_id

  enum payment_methods: {クレジットカード: 0, 銀行振込: 1}
  enum order_status: {入金待ち: 0, 入金確認済: 1, 製作中: 2, 発送準備中: 3, 発送済: 4}
  
end

