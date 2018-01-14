# == Schema Information
#
# Table name: sales_orders
#
#  id             :integer          not null, primary key
#  date           :date
#  country        :string
#  woocommerce_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class SalesOrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
