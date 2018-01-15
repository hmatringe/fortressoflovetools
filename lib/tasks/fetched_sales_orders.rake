namespace :fetched_sales_orders do
  desc "Parsing data from All FetchedSalesOrders"
  task process_all: :environment do
  	fsos = FetchedSalesOrder.all
  	fsos.each do |fso|
  		ProcessFetchedSalesOrderJob.perform_now(fso.id)
  	end
  end

  desc "Parsing data from All FetchedSalesOrders"
  task :process, [:fso_id] => :environment do |t, args|
  	fso = FetchedSalesOrder.find(args[:fso_id])
  	ProcessFetchedSalesOrderJob.perform_now(fso.id)
  end
end
