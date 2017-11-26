class Inventory < ApplicationRecord
  has_many :inventory_primary_lines, dependent: :destroy
  has_many :purchase_order_drafts

  validates :date, presence: true

  def select_label
    "Inventory made - #{self.date}"
  end
end
