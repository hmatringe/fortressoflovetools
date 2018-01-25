# == Schema Information
#
# Table name: parent_products
#
#  id                        :integer          not null, primary key
#  sku                       :string
#  usual_production_price    :decimal(11, 4)
#  usual_production_currency :string           default("EUR")
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  photo                     :string
#

require 'test_helper'

class ParentProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
