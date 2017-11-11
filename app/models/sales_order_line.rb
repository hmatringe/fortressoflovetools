class SalesOrderLine < ApplicationRecord

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