class CreateCartProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_products do |t|
      t.integer :product_id, null: false
      t.integer :user_id, null: false
      t.integer :amount, null: false, default: 1

      t.timestamps
    end
  end
end
