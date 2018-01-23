# == Schema Information
#
# Table name: products
#
#  id                     :integer          not null, primary key
#  SKU                    :string
#  name                   :string
#  size                   :string
#  color                  :string
#  structure              :string
#  category               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  parentSKU              :string
#  supplier_id            :integer
#  heel_thickness         :integer
#  platform               :boolean
#  material               :string
#  heel_height            :string
#  closing_type           :string
#  EAN                    :integer
#  woocommerce_product_id :string
#  parent_product_id      :integer
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
    test "select_label class method" do
    supplier = Supplier.first
    product = Product.new(name: "test_name",
													size: 36,
													color: "test_color",
													SKU: "test_SKU",
													structure: "test_structure",
													category: "test_category",
													heel_thickness: "test_heal_thickness",
													platform: "test_platform",
													material: "test_material",
													heel_height: "test_heal_height",
													closing_type: "test_closing_type",
													EAN: 999999,
													woocommerce_product_id: "test_woocommerce_product_id",
													supplier: supplier)
    assert_equal "Test_name - Size: 36 - test_color - test_SKU", product.select_label
  end
end
