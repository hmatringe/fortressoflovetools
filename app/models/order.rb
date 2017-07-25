class Order < ApplicationRecord
  has_many :order_lines, dependent: :destroy
  has_many :products, through: :order_lines
  has_many :invoices

  validates :name, presence: true, uniqueness: true
end
