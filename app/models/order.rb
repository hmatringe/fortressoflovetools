# == Schema Information
#
# Table name: orders
#
#  id                        :integer          not null, primary key
#  name                      :string
#  qtty                      :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  invoice_currency          :string
#  invoice_reference         :string
#  additional_costs_per_unit :decimal(11, 4)
#  additional_costs          :decimal(11, 4)
#  arrival_in_stock_date     :date
#

class Order < ApplicationRecord
  has_many :order_lines, dependent: :destroy
  has_many :products, through: :order_lines
  has_many :invoices, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :arrival_in_stock_date, presence: true

  def total_value
  	order_lines.each_with_object([]) do |ol, a|
  		a << ol.total_costs_per_unit.to_f * ol.qtty.to_i
  	end.reduce(:+)
  end
end
