class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :shop_name, null: false
      t.string :shop_image_id, null: false
      t.text :shop_introduction, null: false
      t.integer :making_status, null: false, default: 0
      t.integer :order_status,null: false, default: 0

      t.timestamps
    end
  end
end
