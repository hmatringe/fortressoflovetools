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

require 'test_helper'

class OutOfStockDayTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
