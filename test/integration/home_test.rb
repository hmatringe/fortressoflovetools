require 'test_helper'

class HomeTest < ActionDispatch::IntegrationTest
  test "home loads correctly for unlogged user" do
    visit "/"
    # save_and_open_screenshot
    assert_equal 200, page.status_code
    assert page.has_content?("stranger")
  end
end
