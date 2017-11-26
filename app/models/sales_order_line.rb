class SalesOrderLine < ApplicationRecord

  validates :date, presence: true
  validates :qtty, presence: true
  validates :SKU, presence: true
  validates :woocommerce_order_id, presence: true

	def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      attributes = {
      	SKU: row["SKU"],
      	date: row["Order Date"],
      	qtty: row["qtty"]
      }
      SalesOrderLine.create(attributes)
    end
  end
end