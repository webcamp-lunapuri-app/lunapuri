class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :client_id,  null: false
      t.integer :product_id, null: false
      t.integer :count,      null: false

      t.timestamps
    end
  end
end
