class Delivery < ApplicationRecord
  belongs_to :client
  
  def full_delivery_info
    self.postal_code + self.address + self.name
  end
end
