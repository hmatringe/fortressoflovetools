class PurchaseOrderDraft < ApplicationRecord
  belongs_to :inventory
  has_many :purchase_order_draft_lines, dependent: :destroy
  belongs_to :supplier

  validates :name, presence: true
  validates :supply_period_days, presence: true
end
