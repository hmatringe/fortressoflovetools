class InventoryPrimaryLine < ApplicationRecord
  belongs_to :product
  belongs_to :inventory
  validates :inventory, uniqueness: { scope: :product}
end
