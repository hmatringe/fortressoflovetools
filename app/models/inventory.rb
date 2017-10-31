class Inventory < ApplicationRecord
  has_many :inventory_primary_lines, dependent: :destroy

  def sum_self
    array = []
    self.inventory_primary_lines.each do |ipl|
      array << ipl.qtty.to_i
    end
    array.inject(0){|sum,ipl| sum + ipl}
  end
end
