namespace :fetched_sales_orders do
  desc "Parsing Sales data received from Woocommerce into DB"
  task process_all: :environment do
  	fsos = FetchedSalesOrder.all
  	fsos.each do |fso|
  		ProcessFetchedSalesOrderJob.perform_now(fso.id)
  	end
  end

end
