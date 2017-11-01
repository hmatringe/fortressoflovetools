class PurchaseOrderDraft < ApplicationRecord
  belongs_to :inventory
  has_many :purchase_order_draft_lines
end
