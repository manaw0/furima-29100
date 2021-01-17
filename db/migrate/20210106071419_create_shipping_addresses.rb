class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.integer :postal_code,         null: false
      t.integer :prefecture_id,       null: false
      t.string  :municipality,        null: false
      t.string  :address,             null: false
      t.string  :building_name
      t.integer :phone_number,        null: false
      t.references :purchase,         null: false, foreign_key: true 
      t.timestamps
    end
  end
end
