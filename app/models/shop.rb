class Shop < ApplicationRecord
  has_many :products
  attachment :shop_image
end
