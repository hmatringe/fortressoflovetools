require 'test_helper'

class OutOfStocksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get out_of_stocks_index_url
    assert_response :success
  end

  test "should get create" do
    get out_of_stocks_create_url
    assert_response :success
  end

  test "should get delete" do
    get out_of_stocks_delete_url
    assert_response :success
  end

end
