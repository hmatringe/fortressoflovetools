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

require 'test_helper'

class OutOfStockRangeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
