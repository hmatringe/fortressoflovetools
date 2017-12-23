# == Schema Information
#
# Table name: inventory_primary_lines
#
#  id                               :integer          not null, primary key
#  product_id                       :integer
#  inventory_id                     :integer
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  qtty                             :string
#  average_inventory_value_per_unit :decimal(11, 4)   default(0.0)
#

class InventoryPrimaryLine < ApplicationRecord
  belongs_to :product
  belongs_to :inventory
  
  validates :inventory, uniqueness: { scope: :product}
  validates :qtty, presence: true

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |p|
        csv << p.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file,inventory_id)
    CSV.foreach(file.path, headers: true) do |row|
      @inventory_primary_line = InventoryPrimaryLine.new
      unless Product.where(SKU: row["SKU"]).first.nil?
        @inventory_primary_line.product = Product.where(SKU: row["SKU"]).first
        @inventory_primary_line.inventory = Inventory.find(inventory_id)
        @inventory_primary_line.qtty = row["Quantity"]
        compute_total_costs_per_unit
        @inventory_primary_line.save
      end
    end
  end

  def self.compute_total_costs_per_unit
    array = []
    # get all the order_lines for this product sort by order/arrival_in_stock_date
    sorted = @inventory_primary_line.product.order_lines.sort_by &:arrival_in_stock_date
    sorted.reverse!
    sorted.each do |ol|
      ol.qtty.times {array << ol.total_costs_per_unit.to_f}
    end
    @inventory_primary_line.average_inventory_value_per_unit = array.first(@inventory_primary_line.qtty.to_i).inject{ |sum, el| sum + el }.to_f / @inventory_primary_line.qtty.to_i
  end
end
