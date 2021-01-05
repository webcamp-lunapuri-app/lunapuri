class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :last_name,            null: false
      t.string :first_name,           null: false
      t.string :last_name_kana,       null: false
      t.string :first_name_kana,      null: false
      t.string :email,                null: false
      t.string :encrypted_password,   null: false
      t.string :postal_code,          null: false
      t.string :address,              null: false
      t.string :tel,                  null: false
      t.boolean :is_unsubscribe_flag, null: false, default: false

      t.timestamps
    end
  end
end
