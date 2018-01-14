class ProcessFetchedSalesOrderJob < ApplicationJob
  queue_as :default

  def perform(fso_id)
    fso = FetchedSalesOrder.find(fso_id)

  	date = Date.parse(fso.body["date_created"])

  	so_attributes = {
  		date: date, 
  		country: fso.body["billing"]["country"],
  		woocommerce_id: fso.body["id"]
  	}
  	so = SalesOrder.new so_attributes
  	if so.save 
  		puts "Sales Order #{so.woocommerce_id} saved" 
  	else
  		puts "Error importing Sales Order #{so.woocommerce_id}" 
  	end
  	fso.body["line_items"].each do |li|
  		sol = SalesOrderLine.new
  		sol.date = date
  	  sol.qtty = li["quantity"]
  	  sol.woocommerce_order_line_id = li["id"]
  	  sol.sales_order = so
  	  sol.product = Product.where(EAN: li["sku"]).first
  	  sol.subtotal = li["subtotal"].to_d
  		sol.subtotal_tax = li["subtotal_tax"].to_d
  		sol.total = li["total"].to_d
  		sol.total_tax = li["total_tax"].to_d
  		sol.price = li["price"].to_d
  	  if sol.save!
  			puts "Sales Order Line #{sol.woocommerce_order_line_id} saved" 
  	  else
  			puts "Error importing Sales Order Line #{so1.woocommerce_order_line_id}" 
  	  end
  		
  		# coupons
  		fso.body["coupon_lines"].each do |cl|
  			if Coupon.where(code: cl["code"]).exists?
  				cp = Coupon.where(code: cl["code"]).first
  			else
  				cp = Coupon.create code: cl["code"]
  			end
  			cpl = CouponLine.new coupon: cp, sales_order_line: sol

  			if cpl.save!
  				puts "Coupon #{cpl.coupon.code} added to #{sol.woocommerce_order_line_id}" 
  		  else
  				puts "Error adding coupon #{cpl.coupon.code} to #{sol.woocommerce_order_line_id}" 
  		  end

  		end

  	end
  	fso.processed!
  end
end
