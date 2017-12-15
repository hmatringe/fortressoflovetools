require 'test_helper'

class ProductAccessTest < ActionDispatch::IntegrationTest
  test "unlogged user can not access /products" do
    visit '/products'
    # save_and_open_screenshot
    assert_equal 200, page.status_code
    assert_not page.has_content?("EAN"), "Unlogged user could see 'Download', so the page probably loaded!"
  end
end
