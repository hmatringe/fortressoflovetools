class Inventory < ApplicationRecord
  has_many :inventory_primary_lines, dependent: :destroy
end
