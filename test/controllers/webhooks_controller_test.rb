require 'test_helper'

class WebhooksControllerTest < ActionDispatch::IntegrationTest
  test "should get receive_fetched_sales_orders" do
    get webhooks_receive_fetched_sales_orders_url
    assert_response :success
  end

end
