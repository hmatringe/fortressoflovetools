# == Schema Information
#
# Table name: inventories
#
#  id         :integer          not null, primary key
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Inventory < ApplicationRecord
  has_many :inventory_primary_lines, dependent: :destroy
  has_many :purchase_order_drafts, dependent: :destroy

  validates :date, presence: true

  def select_label
    "Inventory made - #{self.date}"
  end

  def total_quantity
  	inventory_primary_lines.each_with_object([]) do |ipl, a|
  		a << ipl.qtty.to_i
  	end.reduce(:+)
  end

  def total_value
  	inventory_primary_lines.each_with_object([]) do |ipl, a|
  		a << ipl.qtty.to_i * ipl.average_inventory_value_per_unit.to_f
  	end.reduce(:+)
  end
end
