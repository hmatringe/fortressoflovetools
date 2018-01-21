# https://www.roccamore.com/wp-json/wc/v2/orders?consumer_key=ck_beda9bf5369892ae35c22a7cc68a1fa2805b7bd7&consumer_secret=cs_d055fb14b13b19dd4c85171cc8591e23381629ae

require "woocommerce_api"

woocommerce = WooCommerce::API.new(
  "https://www.roccamore.com",
  "ck_beda9bf5369892ae35c22a7cc68a1fa2805b7bd7",
  "cs_d055fb14b13b19dd4c85171cc8591e23381629ae",
  {
    wp_api: true,
    version: "wc/v1",
    query_string_auth: true,
  }
)

response2 = woocommerce.get('orders',per_page: 30, page: 4).parsed_response
test_order = response2.last

puts FetchedSalesOrder.last
# woocommerce_sales_order_id = test_order["id"]
# order = FetchedSalesOrder.new(body: data,
#                               woocommerce_sales_order_id: woocommerce_sales_order_id)
# order.save


