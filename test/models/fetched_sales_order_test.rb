# == Schema Information
#
# Table name: fetched_sales_orders
#
#  id                         :integer          not null, primary key
#  woocommerce_sales_order_id :string
#  body                       :json
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#

require 'test_helper'

class FetchedSalesOrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
