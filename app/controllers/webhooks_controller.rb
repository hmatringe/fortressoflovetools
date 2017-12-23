class WebhooksController < ApplicationController
	skip_before_action :verify_authenticity_token
	skip_before_action :authenticate_user!
	
  def receive_fetched_sales_orders
  	data = JSON.parse request.body.read
  	order = FetchedSalesOrder.new(body: data)
  	order.save
  	# FetchedSalesOrder.create(body: JSON.parse(request.body))
  	render nothing: true
  end
end
