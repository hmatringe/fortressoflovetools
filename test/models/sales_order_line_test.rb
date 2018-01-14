# == Schema Information
#
# Table name: sales_order_lines
#
#  id                        :integer          not null, primary key
#  date                      :datetime
#  qtty                      :integer
#  SKU                       :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  sales_order_id            :integer
#  product_id                :integer
#  woocommerce_order_line_id :string
#  subtotal                  :decimal(11, 4)
#  subtotal_tax              :decimal(11, 4)
#  total                     :decimal(11, 4)
#  total_tax                 :decimal(11, 4)
#  price                     :decimal(11, 4)
#

require 'test_helper'

class SalesOrderLineTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
