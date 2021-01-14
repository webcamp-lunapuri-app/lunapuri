class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :deliveries, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  enum is_unsubscribe_flag: {Available: false, Invalid: true}

  def active_for_authentication?
    super && (self.is_unsubscribe_flag === "Available")
  end

  def full_name
    self.last_name + self.first_name
  end
end
