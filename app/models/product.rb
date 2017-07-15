class Product < ApplicationRecord
  has_many :order_lines, dependent: :destroy
  has_many :orders, through: :order_lines
end
