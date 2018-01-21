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

  desc "Marking All FetchedSalesOrders as to_be_processed and destroying All SO"
  task un_process_all: :environment do
    puts "marking"
    FetchedSalesOrder.all.each {|fso| fso.to_be_processed!}
    puts "destroying"
    SalesOrder.destroy_all
    puts "done"
  end  
end
