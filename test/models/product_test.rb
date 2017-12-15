require 'test_helper'

class ProductTest < ActiveSupport::TestCase
    test "select_label class method" do
    product = Product.new(name: "test_name",
													size: 36,
													color: "test_color",
													SKU: "test_SKU",
													structure: "test_structure",
													category: "test_category",
													heal_thickness: "test_heal_thickness",
													platform: "test_platform",
													material: "test_material",
													heal_height: "test_heal_height",
													closing_type: "test_closing_type",
													EAN: 999999,
													woocommerce_product_id: "test_woocommerce_product_id")
    assert_equal "Test_name - Size: 36 - test_color - test_SKU", product.select_label
  end
end
