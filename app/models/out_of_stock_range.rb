# == Schema Information
#
# Table name: out_of_stock_ranges
#
#  id         :integer          not null, primary key
#  product_id :integer
#  date_range :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class OutOfStockRange < ApplicationRecord
  belongs_to :product
  has_many :out_of_stock_days

  after_create :create_out_of_stock_days

  def days
  	out_of_stock_days.count
  end

  def create_out_of_stock_days
  	range = date_range.split(" ")
  	dates = (Date.parse(range.first)..Date.parse(range.last)).to_a
  	dates.each do |date|
  		ofsd = OutOfStockDay.create date: date, out_of_stock_range: self
  	end
  end
end
