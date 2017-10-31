class OrderLine < ApplicationRecord
  belongs_to :order
  belongs_to :product
  validates :order, uniqueness: { scope: :product}
  # after_save :increment_order_qtty
  # before_destroy :decrement_order_qtty

  # def increment_order_qtty
  #   @order.qtty = @order.qtty.to_i + @order_line.qtty
  #   compute_additional_costs_per_unit
  # end

  # def decrement_order_qtty
  #   @order.qtty = @order.qtty.to_i - @order_line.qtty
  #   compute_additional_costs_per_unit
  # end
end
