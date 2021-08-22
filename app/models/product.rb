class Product < ApplicationRecord
  has_many :cart_products, dependent: :destroy
  has_many :users, through: :cart_products
  
  
  has_many :order_products, dependent: :destroy
  belongs_to :shop
  attachment :image

end
