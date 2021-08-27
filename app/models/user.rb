class User < ApplicationRecord
  has_many :cart_products, dependent: :destroy
  has_many :deliveries, dependent: :destroy
  has_many :orders, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def active_for_authentication?
    super && (unsubscribe_status == false)
  end
end
