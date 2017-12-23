# == Schema Information
#
# Table name: sales_order_lines
#
#  id                   :integer          not null, primary key
#  date                 :datetime
#  qtty                 :integer
#  SKU                  :string
#  woocommerce_order_id :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

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
