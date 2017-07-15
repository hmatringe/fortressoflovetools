class Product < ApplicationRecord
  has_many :order_lines, dependent: :destroy
  has_many :orders, through: :order_lines

  def select_label
    "#{self.name} - size:#{self.size } - #{self.color} - #{self.SKU}"
  end
end
