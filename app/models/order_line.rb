# == Schema Information
#
# Table name: order_lines
#
#  id                                           :integer          not null, primary key
#  qtty                                         :integer
#  order_id                                     :integer
#  product_id                                   :integer
#  created_at                                   :datetime         not null
#  updated_at                                   :datetime         not null
#  production_cost_per_unit_invoice_currency    :decimal(11, 4)
#  production_cost_per_unit_accounting_currency :decimal(11, 4)
#  total_costs_per_unit                         :decimal(11, 4)   default(0.0)
#  arrival_in_stock_date                        :date
#

class OrderLine < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :order, uniqueness: { scope: :product}
  validates :qtty, presence: true
  validates :production_cost_per_unit_invoice_currency, presence: true
  validates :production_cost_per_unit_accounting_currency, presence: true
end
