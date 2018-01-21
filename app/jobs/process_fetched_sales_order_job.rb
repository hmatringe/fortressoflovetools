class ProcessFetchedSalesOrderJob < ApplicationJob
  queue_as :default

  def perform(fso_id)
    fso = FetchedSalesOrder.find(fso_id)
    if fso.processed?
    	puts "FetchedSalesOrder #{fso.id} already processed"
    else
	  	date = Date.parse(fso.body["date_created"])
	  	country = fso.body["billing"]["country"]
	  	so_attributes = {
	  		date: date, 
	  		country: country,
	  		woocommerce_id: fso.body["id"]
	  	}
	  	so = SalesOrder.new so_attributes
	  	if so.save!
	  		fso.processed!
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
	  	  if Product.where(EAN: li["sku"]).present?
		  	  sol.product = Product.where(EAN: li["sku"]).first
	  	  else
	  	  	supplier = Supplier.where(name: "unspecified").first
	  	  	safe_ean = li["sku"].nil? ? 9999999999 : li["sku"]
	  	  	safe_name = li["name"].nil? ? "missing" : li["name"]
	  	  	known_missing_SKUs = ["Limited edition bicycle shopper",
	  	  												"Kickstarted bundled",
	  	  												"International Shipping"]
	  	  	attributes = {
	  	  	  EAN: safe_ean,
	  	  	  SKU: known_missing_SKUs.include?(safe_name) ? safe_name : "missing_SKU_#{rand(1..10000000)}",
	  	  	  name: safe_name, 
	  	  	  size: "missing",
	  	  	  color: "missing",
	  	  	  structure: "missing",
	  	  	  category: "missing",
	  	  	  heel_thickness: 999,
	  	  	  platform: false,
	  	  	  material: "missing",
	  	  	  heel_height: 999,
	  	  	  closing_type: "missing",
	  	  	  woocommerce_product_id: li["variation_id"],
	  	  	  supplier: supplier
					}
					new_product = Product.create attributes
	  	  	sol.product = new_product
		  	end
	  	  sol.subtotal = li["subtotal"].to_d
	  		sol.subtotal_tax = li["subtotal_tax"].to_d
	  		sol.total = li["total"].to_d
	  		sol.total_tax = li["total_tax"].to_d
	  		sol.price = li["price"].to_d
	  		sol.country = country
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
	  end
  end
end
