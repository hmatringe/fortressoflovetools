# == Schema Information
#
# Table name: out_of_stock_days
#
#  id                    :integer          not null, primary key
#  out_of_stock_range_id :integer
#  date                  :date
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class OutOfStockDay < ApplicationRecord
  belongs_to :out_of_stock_range
end
