# == Schema Information
#
# Table name: purchase_order_drafts
#
#  id                 :integer          not null, primary key
#  name               :string
#  supply_period_days :integer
#  inventory_id       :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  supplier_id        :integer
#

require 'test_helper'

class PurchaseOrderDraftTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
