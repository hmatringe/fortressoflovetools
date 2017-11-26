class OrderLine < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :order, uniqueness: { scope: :product}
  validates :qtty, presence: true
  validates :production_cost_per_unit_invoice_currency, presence: true
  validates :production_cost_per_unit_accounting_currency, presence: true
end
