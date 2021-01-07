class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :deliveries
  has_many :orders
  has_many :cart_items

  enum is_unsubscribe_flag: {Available: false, Invalid: true}

  def unsubscribe_for_authentication?
    super && (self.is_unsubscribe_flag === "Available")
  end
end
