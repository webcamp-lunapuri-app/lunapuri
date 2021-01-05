class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :client_id,           null: false
      t.string :delivery_postal_code, null: false
      t.string :delivery_address,     null: false
      t.string :delivery_name,        null: false
      t.integer :delivery_charge,     null: false
      t.integer :total_amounts,       null: false
      t.integer :payment_methods,     null: false, default: 0
      t.integer :order_status,        null: false, default: 0

      t.timestamps
    end
  end
end
