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

require 'test_helper'

class SalesOrderLineTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
