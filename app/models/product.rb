class Product < ApplicationRecord
  belongs_to :genre
  has_many :order_items
  has_many :cart_items
  
  attachment :image
end
