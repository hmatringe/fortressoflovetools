require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "select_label class method works" do
    product = Product.new name: "testName", size: 36, color: "black", SKU: "testSKU"
    assert_equal "testName - size:36 - black - testSKU", product.select_label
  end
end
