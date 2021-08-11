class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.integer :order_id,null: false
      t.integer :product_id, null: false
      t.integer :price, null: false, default: 0
      t.integer :amount, null: false, default: 1
      t.integer :making_status, null: false, default: 0

      t.timestamps
    end
  end
end
