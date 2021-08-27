class CartProduct < ApplicationRecord
  belongs_to :product
  belongs_to :user

  def total_price
    (product.price * amount * 1.10).floor
  end

  def self.all_total_price
    sum { |cart_product| cart_product.total_price }
  end
end
