class OrderLine < ApplicationRecord
  belongs_to :order
  belongs_to :product

  # validates :order_id presence: true
  # validates :product_id presence: true
  validates :order, uniqueness: { scope: :product}
end
