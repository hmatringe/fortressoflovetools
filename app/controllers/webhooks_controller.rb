# require 'pry'
class WebhooksController < ApplicationController
	skip_before_action :verify_authenticity_token
	skip_before_action :authenticate_user!
	
  def receive_fetched_sales_orders
    data = JSON.parse request.body.read
    woocommerce_sales_order_id = data["id"]
    order = FetchedSalesOrder.new(body: data,
                                  woocommerce_sales_order_id: woocommerce_sales_order_id)
    order.save
  	render nothing: true
  end

  def received
    @fetched = FetchedSalesOrder.all
  end
end
