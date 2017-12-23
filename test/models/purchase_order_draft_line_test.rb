# == Schema Information
#
# Table name: purchase_order_draft_lines
#
#  id                         :integer          not null, primary key
#  purchase_order_draft_id    :integer
#  SKU                        :string
#  qtty_in_stock              :integer
#  order_qtty                 :integer
#  sold_in_supply_period_days :integer
#  days_of_sales_after_order  :integer
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  days_out_of_stock          :integer
#  sales_speed                :float
#  qtty_after_order           :integer
#  status                     :integer          default("processing")
#  comments                   :text
#  product_id                 :integer
#

require 'test_helper'

class PurchaseOrderDraftLineTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
