# puts "Seed starting"
# classes = [Product, SalesOrder, SalesOrderLine]
# classes.each do |c|
#   c.destroy_all
# end
# puts "All records deleted"
# puts "creating suppliers"

# Supplier.create name: "Florans"
# Supplier.create name: "Gianna Meliani"
# Supplier.create name: "other"
# Supplier.create name: "unspecified"

# puts "creating products from csv"

# # Steps to upload from https://docs.google.com/spreadsheets/d/1dFg06HE4K1D1mvBd7D_Zg_mkr1_pNaq2SEyVNr6_xo4/edit#gid=0
# # 1 - export as csv
# # 2 - paste in lib/products_seed.csv
# # 3 - comment validations product.rb except SKU and EAN
# # 4 - db:seed
# # 5 - uncomment validations product.rb 

# # test product to test Woocommerce callback
# # test_product = Product.new SKU: "TESTSKU", EAN: "00000000000000", supplier: Supplier.where(name: "other").first
# # test_product.save!

# require 'csv'
# csv_text = File.read(Rails.root.join('lib', 'seeds', 'products_seed.csv'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   row.to_hash
#   pr = Product.new
#   pr.SKU = row["SKU"]
#   pr.name = row["name"]
#   pr.size = row["size"]
#   pr.color = row["color"]
#   pr.structure = row["structure"]
#   pr.category = row["category"]
#   pr.parentSKU = row["parentSKU"]
#   pr.supplier = Supplier.where(name: row["supplier"]).first || Supplier.where(name: "unspecified").first
#   pr.heel_thickness = row["heel_thickness"]
#   pr.platform = true if row["platform"] == "1"
#   pr.material = row["material"]
#   pr.heel_height = row["heel_height"]
#   pr.closing_type = row["closing_type"]
#   pr.EAN = row["EAN"]
#   pr.woocommerce_product_id = row["woocommerce_product_id"]
#   if pr.save!
#   	puts "#{pr.name} in size #{pr.size} successfully saved"
# 	else 
#   	puts "Error saving #{pr.name} in size #{pr.size}"
# 	end
# end

# puts "There are now #{Product.count} products in the database"

# puts "creating one SalesOrder and one SalesOrderLine from latest woocommerce API data manually copied 2018-01-02"

# # require 'json'
# # fetched_sales_orders_json = File.read(Rails.root.join('lib', 'seeds', 'fetched_sales_orders.json'))
# # fetched_sales_orders_parsed = JSON.parse(fetched_sales_orders_json)
# # fetched_sales_orders_parsed.each do |fso|
	
# # 	date = Date.parse(fso["body"]["date_created"])
	
# # 	so_attributes = {
# # 		date: date, 
# # 		country: fso["body"]["billing"]["country"],
# # 		woocommerce_id: fso["body"]["id"]
# # 	}
# # 	so = SalesOrder.new so_attributes
# # 	if so.save 
# # 		puts "Sales Order #{so.woocommerce_id} saved" 
# # 	else
# # 		puts "Error importing Sales Order #{so.woocommerce_id}" 
# # 	end
# # 	fso["body"]["line_items"].each do |li|
# # 		sol = SalesOrderLine.new
# # 		sol.date = date
# # 	  sol.qtty = li["quantity"].to_i
# # 	  sol.woocommerce_order_line_id = li["id"].to_i
# # 	  sol.sales_order = so
# # 	  sol.product = Product.where(EAN: li["sku"]).first
# # 	  sol.subtotal = li["subtotal"].to_d
# # 		sol.subtotal_tax = li["subtotal_tax"].to_d
# # 		sol.total = li["total"].to_d
# # 		sol.total_tax = li["total_tax"].to_d
# # 		sol.price = li["price"].to_d
# # 	  if sol.save!
# # 			puts "Sales Order Line #{sol.woocommerce_order_line_id} saved" 
# # 	  else
# # 			puts "Error importing Sales Order Line #{so1.woocommerce_order_line_id}" 
# # 	  end
		
# # 		# coupons
# # 		fso["body"]["coupon_lines"].each do |cl|
# # 			if Coupon.where(code: cl["code"]).exists?
# # 				cp = Coupon.where(code: cl["code"]).first
# # 			else
# # 				cp = Coupon.create code: cl["code"]
# # 			end
# # 			cpl = CouponLine.new coupon: cp, sales_order_line: sol

# # 			if cpl.save!
# # 				puts "Coupon #{cpl.coupon.code} added to #{sol.woocommerce_order_line_id}" 
# # 		  else
# # 				puts "Error adding coupon #{cpl.coupon.code} to #{sol.woocommerce_order_line_id}" 
# # 		  end

# # 		end

# # 	end

# # end
# # puts "There are now #{SalesOrder.count} Sales Orders in the database"
# # puts "There are now #{SalesOrderLine.count} Sales Orders Lines in the database"





# # json_parsed = JSON.parse('{"body": {
# # 		"id": "11485",
# # 		"parent_id": 0,
# # 		"number": "11485",
# # 		"order_key": "wc_order_5a4b55564e014",
# # 		"created_via": "checkout",
# # 		"version": "3.1.2",
# # 		"status": "processing",
# # 		"currency": "DKK",
# # 		"date_created": "2018-01-02T10:48:06",
# # 		"date_created_gmt": "2018-01-02T09:48:06",
# # 		"date_modified": "2018-01-02T10:48:11",
# # 		"date_modified_gmt": "2018-01-02T09:48:11",
# # 		"discount_total": "0.00",
# # 		"discount_tax": "0.00",
# # 		"shipping_total": "0.00",
# # 		"shipping_tax": "0.00",
# # 		"cart_tax": "440.00",
# # 		"total": "2200.00",
# # 		"total_tax": "440.00",
# # 		"prices_include_tax": true,
# # 		"customer_id": 0,
# # 		"customer_ip_address": "80.62.117.134",
# # 		"customer_user_agent": "mozilla/5.0 (iphone; cpu iphone os 11_1_2 like mac os x) applewebkit/604.3.5 (khtml, like gecko) version/11.0 mobile/15b202 safari/604.1",
# # 		"customer_note": "",
# # 		"billing": {
# # 			"first_name": "Danske Spil",
# # 			"last_name": "Susanne Koch",
# # 			"company": "",
# # 			"address_1": "Korsdalsvej 135",
# # 			"address_2": "",
# # 			"city": "Broendby",
# # 			"state": "",
# # 			"postcode": "2605",
# # 			"country": "DK",
# # 			"email": "smk@danskespil.dk",
# # 			"phone": "30308889"
# # 		},
# # 		"shipping": {
# # 			"first_name": "Danske Spil",
# # 			"last_name": "Susanne Koch",
# # 			"company": "",
# # 			"address_1": "Korsdalsvej 135",
# # 			"address_2": "",
# # 			"city": "Broendby",
# # 			"state": "",
# # 			"postcode": "2605",
# # 			"country": "DK"
# # 		},
# # 		"payment_method": "stripe",
# # 		"payment_method_title": "Credit Card",
# # 		"transaction_id": "ch_1BfmNQJczEAsne03Zwqdgsqf",
# # 		"date_paid": "2018-01-02T10:48:11",
# # 		"date_paid_gmt": "2018-01-02T09:48:11",
# # 		"date_completed": null,
# # 		"date_completed_gmt": null,
# # 		"cart_hash": "64291015a618cc97c42bf797273d245e",
# # 		"meta_data": [{
# # 			"id": 156847,
# # 			"key": "mailchimp_woocommerce_is_subscribed",
# # 			"value": "0"
# # 		}, {
# # 			"id": 156848,
# # 			"key": "_stripe_card_id",
# # 			"value": "tok_1BfmNLJczEAsne032xFKs81A"
# # 		}, {
# # 			"id": 156849,
# # 			"key": "_stripe_charge_id",
# # 			"value": "ch_1BfmNQJczEAsne03Zwqdgsqf"
# # 		}, {
# # 			"id": 156850,
# # 			"key": "_stripe_charge_captured",
# # 			"value": "yes"
# # 		}, {
# # 			"id": 156851,
# # 			"key": "Stripe Fee",
# # 			"value": "4.30"
# # 		}, {
# # 			"id": 156852,
# # 			"key": "Net Revenue From Stripe",
# # 			"value": "285.30"
# # 		}, {
# # 			"id": 156853,
# # 			"key": "_wcj_invoicing_invoice_number_id",
# # 			"value": "11485"
# # 		}, {
# # 			"id": 156854,
# # 			"key": "_wcj_invoicing_invoice_date",
# # 			"value": "1514890092"
# # 		}, {
# # 			"id": 156855,
# # 			"key": "_download_permissions_granted",
# # 			"value": "yes"
# # 		}, {
# # 			"id": 156858,
# # 			"key": "_order_stock_reduced",
# # 			"value": "yes"
# # 		}],
# # 		"line_items": [{
# # 			"id": 6214,
# # 			"name": "sophie - 38",
# # 			"product_id": 10607,
# # 			"variation_id": 10610,
# # 			"quantity": 1,
# # 			"tax_class": "",
# # 			"subtotal": "1760.00",
# # 			"subtotal_tax": "440.00",
# # 			"total": "1760.00",
# # 			"total_tax": "440.00",
# # 			"taxes": [{
# # 				"id": 10,
# # 				"total": "440",
# # 				"subtotal": "440"
# # 			}],
# # 			"meta_data": [{
# # 				"id": 38792,
# # 				"key": "pa_size",
# # 				"value": "38"
# # 			}],
# # 			"sku": "5113036005262",
# # 			"price": 1760
# # 		}],
# # 		"tax_lines": [{
# # 			"id": 6216,
# # 			"rate_code": "DK-VALUE ADDED TAX DK - MOMS-1",
# # 			"rate_id": 10,
# # 			"label": "Value Added Tax DK - MOMS",
# # 			"compound": false,
# # 			"tax_total": "440.00",
# # 			"shipping_tax_total": "0.00",
# # 			"meta_data": []
# # 		}],
# # 		"shipping_lines": [{
# # 			"id": 6215,
# # 			"method_title": "Free shipping",
# # 			"method_id": "free_shipping:2",
# # 			"total": "0.00",
# # 			"total_tax": "0.00",
# # 			"taxes": [],
# # 			"meta_data": [{
# # 				"id": 38797,
# # 				"key": "Items",
# # 				"value": "sophie - 38 &times; 1"
# # 			}]
# # 		}],
# # 		"fee_lines": [],
# # 		"coupon_lines": [],
# # 		"refunds": []
# # 	}
# # }')
# # so1_attributes = {
# # 	date: Date.parse(json_parsed["body"]["date_created"]),
# # 	country: json_parsed["body"]["billing"]["country"],
# # 	woocommerce_id: json_parsed["body"]["id"]
# # }
# # so1 = SalesOrder.new so1_attributes

# # if so1.save 
# # 	p "Sales Order #{so1.woocommerce_id} saved" 
# # else
# # 	p "Error importing Sales Order #{so1.woocommerce_id}" 
# # end

# # json_parsed["body"]["line_items"].each do |li|
# # 	sol = SalesOrderLine.new
# # 	sol.date = Date.parse(json_parsed["body"]["date_created"])
# #   sol.qtty = li["quantity"].to_i
# #   # sol.SKU = li["sku"]
# #   sol.woocommerce_order_line_id = li["id"].to_i
# #   sol.sales_order = SalesOrder.first
# #   sol.product = Product.where(EAN: li["sku"]).first
# #   sol.subtotal = li["subtotal"].to_i
# # 	sol.subtotal_tax = li["subtotal_tax"].to_i
# # 	sol.total = li["total"].to_i
# # 	sol.total_tax = li["total_tax"].to_i
# # 	sol.price = li["price"].to_i
# #   if sol.save!
# # 		p "Sales Order Line #{sol.woocommerce_order_line_id} saved" 
# #   else
# # 		p "Error importing Sales Order Line #{so1.woocommerce_order_line_id}" 
# #   end
# # end







# require "woocommerce_api"

# woocommerce = WooCommerce::API.new(
#   "https://www.roccamore.com",
#   "ck_beda9bf5369892ae35c22a7cc68a1fa2805b7bd7",
#   "cs_d055fb14b13b19dd4c85171cc8591e23381629ae",
#   {
#     wp_api: true,
#     version: "wc/v1",
#     query_string_auth: true,
#   }
# )

# pages = 1..100

# pages.each do |page|

# 	responses = woocommerce.get('orders',per_page: 30, page: page).parsed_response

# 	responses.each do |response|
# 		if FetchedSalesOrder.where(woocommerce_sales_order_id: response["id"]).exists?
# 			puts "FSO already exists, let's SKIP"
# 		else
# 		  woocommerce_sales_order_id = response["id"]
# 		  order = FetchedSalesOrder.new(body: response, woocommerce_sales_order_id: woocommerce_sales_order_id)
# 		  order.save!
# 			puts "Order #{response["id"]} saved as FetchedSalesOrder #{order.id}"
# 		end
# 	end
# end


# ____________________________PARENT PRODUCTS_______________________________________________
# product = Product.new(SKU:"bssku")
# product.supplier = Supplier.first
# product.parent_product = ParentProduct.first
# product.save!

# product = Product.where(SKU: "bssku").first
# if ParentProduct.where(sku: "RMSS16-001-Black").present?
# pp = ParentProduct.where(sku: "RMSS16-001-Black").first
# else	
# pp = ParentProduct.create(sku: "RMSS16-001-Black", usual_production_price: 80)
# end
# p pp.sku
# product.parent_product = pp
# product.save!


product = Product.where(SKU: "RMSS16-001-Black-36").first
if ParentProduct.where(sku: "RMSS16-001-Black").present?
	pp = ParentProduct.where(sku: "RMSS16-001-Black").first
else
	pp = ParentProduct.create(sku: "RMSS16-001-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-001-Black-37").first
if ParentProduct.where(sku: "RMSS16-001-Black").present?
	pp = ParentProduct.where(sku: "RMSS16-001-Black").first
else
	pp = ParentProduct.create(sku: "RMSS16-001-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-001-Black-38").first
if ParentProduct.where(sku: "RMSS16-001-Black").present?
	pp = ParentProduct.where(sku: "RMSS16-001-Black").first
else
	pp = ParentProduct.create(sku: "RMSS16-001-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-001-Black-39").first
if ParentProduct.where(sku: "RMSS16-001-Black").present?
	pp = ParentProduct.where(sku: "RMSS16-001-Black").first
else
	pp = ParentProduct.create(sku: "RMSS16-001-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-001-Black-40").first
if ParentProduct.where(sku: "RMSS16-001-Black").present?
	pp = ParentProduct.where(sku: "RMSS16-001-Black").first
else
	pp = ParentProduct.create(sku: "RMSS16-001-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-001-Black-41").first
if ParentProduct.where(sku: "RMSS16-001-Black").present?
	pp = ParentProduct.where(sku: "RMSS16-001-Black").first
else
	pp = ParentProduct.create(sku: "RMSS16-001-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-003-Cream-36").first
if ParentProduct.where(sku: "RMAW16-17-003-Cream").present?
	pp = ParentProduct.where(sku: "RMAW16-17-003-Cream").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-003-Cream", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-003-Cream-37").first
if ParentProduct.where(sku: "RMAW16-17-003-Cream").present?
	pp = ParentProduct.where(sku: "RMAW16-17-003-Cream").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-003-Cream", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-003-Cream-38").first
if ParentProduct.where(sku: "RMAW16-17-003-Cream").present?
	pp = ParentProduct.where(sku: "RMAW16-17-003-Cream").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-003-Cream", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-003-Cream-39").first
if ParentProduct.where(sku: "RMAW16-17-003-Cream").present?
	pp = ParentProduct.where(sku: "RMAW16-17-003-Cream").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-003-Cream", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-003-Cream-40").first
if ParentProduct.where(sku: "RMAW16-17-003-Cream").present?
	pp = ParentProduct.where(sku: "RMAW16-17-003-Cream").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-003-Cream", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-003-Cream-41").first
if ParentProduct.where(sku: "RMAW16-17-003-Cream").present?
	pp = ParentProduct.where(sku: "RMAW16-17-003-Cream").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-003-Cream", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-006-Grey-36").first
if ParentProduct.where(sku: "RMSS16-006-Grey").present?
	pp = ParentProduct.where(sku: "RMSS16-006-Grey").first
else
	pp = ParentProduct.create(sku: "RMSS16-006-Grey", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-006-Grey-37").first
if ParentProduct.where(sku: "RMSS16-006-Grey").present?
	pp = ParentProduct.where(sku: "RMSS16-006-Grey").first
else
	pp = ParentProduct.create(sku: "RMSS16-006-Grey", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-006-Grey-38").first
if ParentProduct.where(sku: "RMSS16-006-Grey").present?
	pp = ParentProduct.where(sku: "RMSS16-006-Grey").first
else
	pp = ParentProduct.create(sku: "RMSS16-006-Grey", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-006-Grey-39").first
if ParentProduct.where(sku: "RMSS16-006-Grey").present?
	pp = ParentProduct.where(sku: "RMSS16-006-Grey").first
else
	pp = ParentProduct.create(sku: "RMSS16-006-Grey", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-006-Grey-40").first
if ParentProduct.where(sku: "RMSS16-006-Grey").present?
	pp = ParentProduct.where(sku: "RMSS16-006-Grey").first
else
	pp = ParentProduct.create(sku: "RMSS16-006-Grey", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-006-Grey-41").first
if ParentProduct.where(sku: "RMSS16-006-Grey").present?
	pp = ParentProduct.where(sku: "RMSS16-006-Grey").first
else
	pp = ParentProduct.create(sku: "RMSS16-006-Grey", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-003-White-36").first
if ParentProduct.where(sku: "RMAW16-17-003-White").present?
	pp = ParentProduct.where(sku: "RMAW16-17-003-White").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-003-White", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-003-White-37").first
if ParentProduct.where(sku: "RMAW16-17-003-White").present?
	pp = ParentProduct.where(sku: "RMAW16-17-003-White").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-003-White", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-003-White-38").first
if ParentProduct.where(sku: "RMAW16-17-003-White").present?
	pp = ParentProduct.where(sku: "RMAW16-17-003-White").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-003-White", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-003-White-39").first
if ParentProduct.where(sku: "RMAW16-17-003-White").present?
	pp = ParentProduct.where(sku: "RMAW16-17-003-White").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-003-White", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-003-White-40").first
if ParentProduct.where(sku: "RMAW16-17-003-White").present?
	pp = ParentProduct.where(sku: "RMAW16-17-003-White").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-003-White", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-003-White-41").first
if ParentProduct.where(sku: "RMAW16-17-003-White").present?
	pp = ParentProduct.where(sku: "RMAW16-17-003-White").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-003-White", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-001-Cordovan-36").first
if ParentProduct.where(sku: "RMAW16-17-001-Cordovan").present?
	pp = ParentProduct.where(sku: "RMAW16-17-001-Cordovan").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-001-Cordovan", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-001-Cordovan-37").first
if ParentProduct.where(sku: "RMAW16-17-001-Cordovan").present?
	pp = ParentProduct.where(sku: "RMAW16-17-001-Cordovan").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-001-Cordovan", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-001-Cordovan-38").first
if ParentProduct.where(sku: "RMAW16-17-001-Cordovan").present?
	pp = ParentProduct.where(sku: "RMAW16-17-001-Cordovan").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-001-Cordovan", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-001-Cordovan-39").first
if ParentProduct.where(sku: "RMAW16-17-001-Cordovan").present?
	pp = ParentProduct.where(sku: "RMAW16-17-001-Cordovan").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-001-Cordovan", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-001-Cordovan-40").first
if ParentProduct.where(sku: "RMAW16-17-001-Cordovan").present?
	pp = ParentProduct.where(sku: "RMAW16-17-001-Cordovan").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-001-Cordovan", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-001-Cordovan-41").first
if ParentProduct.where(sku: "RMAW16-17-001-Cordovan").present?
	pp = ParentProduct.where(sku: "RMAW16-17-001-Cordovan").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-001-Cordovan", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-003-Black-36").first
if ParentProduct.where(sku: "RMAW16-17-003-Black").present?
	pp = ParentProduct.where(sku: "RMAW16-17-003-Black").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-003-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-003-Black-37").first
if ParentProduct.where(sku: "RMAW16-17-003-Black").present?
	pp = ParentProduct.where(sku: "RMAW16-17-003-Black").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-003-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-003-Black-38").first
if ParentProduct.where(sku: "RMAW16-17-003-Black").present?
	pp = ParentProduct.where(sku: "RMAW16-17-003-Black").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-003-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-003-Black-39").first
if ParentProduct.where(sku: "RMAW16-17-003-Black").present?
	pp = ParentProduct.where(sku: "RMAW16-17-003-Black").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-003-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-003-Black-40").first
if ParentProduct.where(sku: "RMAW16-17-003-Black").present?
	pp = ParentProduct.where(sku: "RMAW16-17-003-Black").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-003-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-003-Black-41").first
if ParentProduct.where(sku: "RMAW16-17-003-Black").present?
	pp = ParentProduct.where(sku: "RMAW16-17-003-Black").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-003-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-006-Black-36").first
if ParentProduct.where(sku: "RMSS16-006-Black").present?
	pp = ParentProduct.where(sku: "RMSS16-006-Black").first
else
	pp = ParentProduct.create(sku: "RMSS16-006-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-006-Black-37").first
if ParentProduct.where(sku: "RMSS16-006-Black").present?
	pp = ParentProduct.where(sku: "RMSS16-006-Black").first
else
	pp = ParentProduct.create(sku: "RMSS16-006-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-006-Black-38").first
if ParentProduct.where(sku: "RMSS16-006-Black").present?
	pp = ParentProduct.where(sku: "RMSS16-006-Black").first
else
	pp = ParentProduct.create(sku: "RMSS16-006-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-006-Black-39").first
if ParentProduct.where(sku: "RMSS16-006-Black").present?
	pp = ParentProduct.where(sku: "RMSS16-006-Black").first
else
	pp = ParentProduct.create(sku: "RMSS16-006-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-006-Black-40").first
if ParentProduct.where(sku: "RMSS16-006-Black").present?
	pp = ParentProduct.where(sku: "RMSS16-006-Black").first
else
	pp = ParentProduct.create(sku: "RMSS16-006-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-006-Black-41").first
if ParentProduct.where(sku: "RMSS16-006-Black").present?
	pp = ParentProduct.where(sku: "RMSS16-006-Black").first
else
	pp = ParentProduct.create(sku: "RMSS16-006-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-001-Gold/Blush-36").first
if ParentProduct.where(sku: "RMSS16-001-Gold/Blush").present?
	pp = ParentProduct.where(sku: "RMSS16-001-Gold/Blush").first
else
	pp = ParentProduct.create(sku: "RMSS16-001-Gold/Blush", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-001-Gold/Blush-37").first
if ParentProduct.where(sku: "RMSS16-001-Gold/Blush").present?
	pp = ParentProduct.where(sku: "RMSS16-001-Gold/Blush").first
else
	pp = ParentProduct.create(sku: "RMSS16-001-Gold/Blush", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-001-Gold/Blush-38").first
if ParentProduct.where(sku: "RMSS16-001-Gold/Blush").present?
	pp = ParentProduct.where(sku: "RMSS16-001-Gold/Blush").first
else
	pp = ParentProduct.create(sku: "RMSS16-001-Gold/Blush", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-001-Gold/Blush-39").first
if ParentProduct.where(sku: "RMSS16-001-Gold/Blush").present?
	pp = ParentProduct.where(sku: "RMSS16-001-Gold/Blush").first
else
	pp = ParentProduct.create(sku: "RMSS16-001-Gold/Blush", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-001-Gold/Blush-40").first
if ParentProduct.where(sku: "RMSS16-001-Gold/Blush").present?
	pp = ParentProduct.where(sku: "RMSS16-001-Gold/Blush").first
else
	pp = ParentProduct.create(sku: "RMSS16-001-Gold/Blush", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-001-Gold/Blush-41").first
if ParentProduct.where(sku: "RMSS16-001-Gold/Blush").present?
	pp = ParentProduct.where(sku: "RMSS16-001-Gold/Blush").first
else
	pp = ParentProduct.create(sku: "RMSS16-001-Gold/Blush", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-001-Pink/Grey-36").first
if ParentProduct.where(sku: "RMSS16-001-Pink/Grey").present?
	pp = ParentProduct.where(sku: "RMSS16-001-Pink/Grey").first
else
	pp = ParentProduct.create(sku: "RMSS16-001-Pink/Grey", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-001-Pink/Grey-37").first
if ParentProduct.where(sku: "RMSS16-001-Pink/Grey").present?
	pp = ParentProduct.where(sku: "RMSS16-001-Pink/Grey").first
else
	pp = ParentProduct.create(sku: "RMSS16-001-Pink/Grey", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-001-Pink/Grey-38").first
if ParentProduct.where(sku: "RMSS16-001-Pink/Grey").present?
	pp = ParentProduct.where(sku: "RMSS16-001-Pink/Grey").first
else
	pp = ParentProduct.create(sku: "RMSS16-001-Pink/Grey", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-001-Pink/Grey-39").first
if ParentProduct.where(sku: "RMSS16-001-Pink/Grey").present?
	pp = ParentProduct.where(sku: "RMSS16-001-Pink/Grey").first
else
	pp = ParentProduct.create(sku: "RMSS16-001-Pink/Grey", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-001-Pink/Grey-40").first
if ParentProduct.where(sku: "RMSS16-001-Pink/Grey").present?
	pp = ParentProduct.where(sku: "RMSS16-001-Pink/Grey").first
else
	pp = ParentProduct.create(sku: "RMSS16-001-Pink/Grey", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-001-Pink/Grey-41").first
if ParentProduct.where(sku: "RMSS16-001-Pink/Grey").present?
	pp = ParentProduct.where(sku: "RMSS16-001-Pink/Grey").first
else
	pp = ParentProduct.create(sku: "RMSS16-001-Pink/Grey", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-002-Python-36").first
if ParentProduct.where(sku: "RMSS16-002-Python").present?
	pp = ParentProduct.where(sku: "RMSS16-002-Python").first
else
	pp = ParentProduct.create(sku: "RMSS16-002-Python", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-002-Python-37").first
if ParentProduct.where(sku: "RMSS16-002-Python").present?
	pp = ParentProduct.where(sku: "RMSS16-002-Python").first
else
	pp = ParentProduct.create(sku: "RMSS16-002-Python", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-002-Python-38").first
if ParentProduct.where(sku: "RMSS16-002-Python").present?
	pp = ParentProduct.where(sku: "RMSS16-002-Python").first
else
	pp = ParentProduct.create(sku: "RMSS16-002-Python", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-002-Python-39").first
if ParentProduct.where(sku: "RMSS16-002-Python").present?
	pp = ParentProduct.where(sku: "RMSS16-002-Python").first
else
	pp = ParentProduct.create(sku: "RMSS16-002-Python", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-002-Python-40").first
if ParentProduct.where(sku: "RMSS16-002-Python").present?
	pp = ParentProduct.where(sku: "RMSS16-002-Python").first
else
	pp = ParentProduct.create(sku: "RMSS16-002-Python", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-002-Python-41").first
if ParentProduct.where(sku: "RMSS16-002-Python").present?
	pp = ParentProduct.where(sku: "RMSS16-002-Python").first
else
	pp = ParentProduct.create(sku: "RMSS16-002-Python", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-005-Black-36").first
if ParentProduct.where(sku: "RMSS16-005-Black").present?
	pp = ParentProduct.where(sku: "RMSS16-005-Black").first
else
	pp = ParentProduct.create(sku: "RMSS16-005-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-005-Black-37").first
if ParentProduct.where(sku: "RMSS16-005-Black").present?
	pp = ParentProduct.where(sku: "RMSS16-005-Black").first
else
	pp = ParentProduct.create(sku: "RMSS16-005-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-005-Black-38").first
if ParentProduct.where(sku: "RMSS16-005-Black").present?
	pp = ParentProduct.where(sku: "RMSS16-005-Black").first
else
	pp = ParentProduct.create(sku: "RMSS16-005-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-005-Black-39").first
if ParentProduct.where(sku: "RMSS16-005-Black").present?
	pp = ParentProduct.where(sku: "RMSS16-005-Black").first
else
	pp = ParentProduct.create(sku: "RMSS16-005-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-005-Black-40").first
if ParentProduct.where(sku: "RMSS16-005-Black").present?
	pp = ParentProduct.where(sku: "RMSS16-005-Black").first
else
	pp = ParentProduct.create(sku: "RMSS16-005-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-005-Black-41").first
if ParentProduct.where(sku: "RMSS16-005-Black").present?
	pp = ParentProduct.where(sku: "RMSS16-005-Black").first
else
	pp = ParentProduct.create(sku: "RMSS16-005-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Black-36").first
if ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Black").present?
	pp = ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Black").first
else
	pp = ParentProduct.create(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Black-37").first
if ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Black").present?
	pp = ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Black").first
else
	pp = ParentProduct.create(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Black-38").first
if ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Black").present?
	pp = ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Black").first
else
	pp = ParentProduct.create(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Black-39").first
if ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Black").present?
	pp = ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Black").first
else
	pp = ParentProduct.create(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Black-40").first
if ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Black").present?
	pp = ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Black").first
else
	pp = ParentProduct.create(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Black-41").first
if ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Black").present?
	pp = ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Black").first
else
	pp = ParentProduct.create(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Shadow-36").first
if ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Shadow").present?
	pp = ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Shadow").first
else
	pp = ParentProduct.create(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Shadow", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Shadow-37").first
if ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Shadow").present?
	pp = ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Shadow").first
else
	pp = ParentProduct.create(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Shadow", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Shadow-38").first
if ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Shadow").present?
	pp = ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Shadow").first
else
	pp = ParentProduct.create(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Shadow", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Shadow-39").first
if ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Shadow").present?
	pp = ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Shadow").first
else
	pp = ParentProduct.create(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Shadow", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Shadow-40").first
if ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Shadow").present?
	pp = ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Shadow").first
else
	pp = ParentProduct.create(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Shadow", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Shadow-41").first
if ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Shadow").present?
	pp = ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Shadow").first
else
	pp = ParentProduct.create(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Shadow", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-005-Blue-36").first
if ParentProduct.where(sku: "RMSS16-005-Blue").present?
	pp = ParentProduct.where(sku: "RMSS16-005-Blue").first
else
	pp = ParentProduct.create(sku: "RMSS16-005-Blue", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-005-Blue-37").first
if ParentProduct.where(sku: "RMSS16-005-Blue").present?
	pp = ParentProduct.where(sku: "RMSS16-005-Blue").first
else
	pp = ParentProduct.create(sku: "RMSS16-005-Blue", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-005-Blue-38").first
if ParentProduct.where(sku: "RMSS16-005-Blue").present?
	pp = ParentProduct.where(sku: "RMSS16-005-Blue").first
else
	pp = ParentProduct.create(sku: "RMSS16-005-Blue", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-005-Blue-39").first
if ParentProduct.where(sku: "RMSS16-005-Blue").present?
	pp = ParentProduct.where(sku: "RMSS16-005-Blue").first
else
	pp = ParentProduct.create(sku: "RMSS16-005-Blue", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-005-Blue-40").first
if ParentProduct.where(sku: "RMSS16-005-Blue").present?
	pp = ParentProduct.where(sku: "RMSS16-005-Blue").first
else
	pp = ParentProduct.create(sku: "RMSS16-005-Blue", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-005-Blue-41").first
if ParentProduct.where(sku: "RMSS16-005-Blue").present?
	pp = ParentProduct.where(sku: "RMSS16-005-Blue").first
else
	pp = ParentProduct.create(sku: "RMSS16-005-Blue", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-002-Blue-36").first
if ParentProduct.where(sku: "RMSS16-002-Blue").present?
	pp = ParentProduct.where(sku: "RMSS16-002-Blue").first
else
	pp = ParentProduct.create(sku: "RMSS16-002-Blue", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-002-Blue-37").first
if ParentProduct.where(sku: "RMSS16-002-Blue").present?
	pp = ParentProduct.where(sku: "RMSS16-002-Blue").first
else
	pp = ParentProduct.create(sku: "RMSS16-002-Blue", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-002-Blue-38").first
if ParentProduct.where(sku: "RMSS16-002-Blue").present?
	pp = ParentProduct.where(sku: "RMSS16-002-Blue").first
else
	pp = ParentProduct.create(sku: "RMSS16-002-Blue", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-002-Blue-39").first
if ParentProduct.where(sku: "RMSS16-002-Blue").present?
	pp = ParentProduct.where(sku: "RMSS16-002-Blue").first
else
	pp = ParentProduct.create(sku: "RMSS16-002-Blue", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-002-Blue-40").first
if ParentProduct.where(sku: "RMSS16-002-Blue").present?
	pp = ParentProduct.where(sku: "RMSS16-002-Blue").first
else
	pp = ParentProduct.create(sku: "RMSS16-002-Blue", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-002-Blue-41").first
if ParentProduct.where(sku: "RMSS16-002-Blue").present?
	pp = ParentProduct.where(sku: "RMSS16-002-Blue").first
else
	pp = ParentProduct.create(sku: "RMSS16-002-Blue", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-003-Eclipse-36").first
if ParentProduct.where(sku: "RMAW16-17-003-Eclipse").present?
	pp = ParentProduct.where(sku: "RMAW16-17-003-Eclipse").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-003-Eclipse", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-003-Eclipse-37").first
if ParentProduct.where(sku: "RMAW16-17-003-Eclipse").present?
	pp = ParentProduct.where(sku: "RMAW16-17-003-Eclipse").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-003-Eclipse", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-003-Eclipse-38").first
if ParentProduct.where(sku: "RMAW16-17-003-Eclipse").present?
	pp = ParentProduct.where(sku: "RMAW16-17-003-Eclipse").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-003-Eclipse", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-003-Eclipse-39").first
if ParentProduct.where(sku: "RMAW16-17-003-Eclipse").present?
	pp = ParentProduct.where(sku: "RMAW16-17-003-Eclipse").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-003-Eclipse", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-003-Eclipse-40").first
if ParentProduct.where(sku: "RMAW16-17-003-Eclipse").present?
	pp = ParentProduct.where(sku: "RMAW16-17-003-Eclipse").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-003-Eclipse", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-003-Eclipse-41").first
if ParentProduct.where(sku: "RMAW16-17-003-Eclipse").present?
	pp = ParentProduct.where(sku: "RMAW16-17-003-Eclipse").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-003-Eclipse", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Grey-36").first
if ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Grey").present?
	pp = ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Grey").first
else
	pp = ParentProduct.create(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Grey", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Grey-37").first
if ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Grey").present?
	pp = ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Grey").first
else
	pp = ParentProduct.create(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Grey", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Grey-38").first
if ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Grey").present?
	pp = ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Grey").first
else
	pp = ParentProduct.create(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Grey", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Grey-39").first
if ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Grey").present?
	pp = ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Grey").first
else
	pp = ParentProduct.create(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Grey", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Grey-40").first
if ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Grey").present?
	pp = ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Grey").first
else
	pp = ParentProduct.create(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Grey", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Grey-41").first
if ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Grey").present?
	pp = ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Grey").first
else
	pp = ParentProduct.create(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Grey", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Wine-36").first
if ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Wine").present?
	pp = ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Wine").first
else
	pp = ParentProduct.create(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Wine", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Wine-37").first
if ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Wine").present?
	pp = ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Wine").first
else
	pp = ParentProduct.create(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Wine", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Wine-38").first
if ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Wine").present?
	pp = ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Wine").first
else
	pp = ParentProduct.create(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Wine", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Wine-39").first
if ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Wine").present?
	pp = ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Wine").first
else
	pp = ParentProduct.create(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Wine", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Wine-40").first
if ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Wine").present?
	pp = ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Wine").first
else
	pp = ParentProduct.create(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Wine", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Wine-41").first
if ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Wine").present?
	pp = ParentProduct.where(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Wine").first
else
	pp = ParentProduct.create(sku: "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Wine", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero-36").first
if ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero").present?
	pp = ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero").first
else
	pp = ParentProduct.create(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero-37").first
if ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero").present?
	pp = ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero").first
else
	pp = ParentProduct.create(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero-38").first
if ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero").present?
	pp = ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero").first
else
	pp = ParentProduct.create(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero-39").first
if ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero").present?
	pp = ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero").first
else
	pp = ParentProduct.create(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero-40").first
if ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero").present?
	pp = ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero").first
else
	pp = ParentProduct.create(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero-41").first
if ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero").present?
	pp = ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero").first
else
	pp = ParentProduct.create(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Midnight-36").first
if ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Midnight").present?
	pp = ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Midnight").first
else
	pp = ParentProduct.create(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Midnight", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Midnight-37").first
if ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Midnight").present?
	pp = ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Midnight").first
else
	pp = ParentProduct.create(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Midnight", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Midnight-38").first
if ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Midnight").present?
	pp = ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Midnight").first
else
	pp = ParentProduct.create(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Midnight", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Midnight-39").first
if ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Midnight").present?
	pp = ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Midnight").first
else
	pp = ParentProduct.create(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Midnight", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Midnight-40").first
if ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Midnight").present?
	pp = ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Midnight").first
else
	pp = ParentProduct.create(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Midnight", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Midnight-41").first
if ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Midnight").present?
	pp = ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Midnight").first
else
	pp = ParentProduct.create(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Midnight", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-001-Black-36").first
if ParentProduct.where(sku: "RMAW16-17-001-Black").present?
	pp = ParentProduct.where(sku: "RMAW16-17-001-Black").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-001-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-001-Black-37").first
if ParentProduct.where(sku: "RMAW16-17-001-Black").present?
	pp = ParentProduct.where(sku: "RMAW16-17-001-Black").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-001-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-001-Black-38").first
if ParentProduct.where(sku: "RMAW16-17-001-Black").present?
	pp = ParentProduct.where(sku: "RMAW16-17-001-Black").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-001-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-001-Black-39").first
if ParentProduct.where(sku: "RMAW16-17-001-Black").present?
	pp = ParentProduct.where(sku: "RMAW16-17-001-Black").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-001-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-001-Black-40").first
if ParentProduct.where(sku: "RMAW16-17-001-Black").present?
	pp = ParentProduct.where(sku: "RMAW16-17-001-Black").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-001-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW16-17-001-Black-41").first
if ParentProduct.where(sku: "RMAW16-17-001-Black").present?
	pp = ParentProduct.where(sku: "RMAW16-17-001-Black").first
else
	pp = ParentProduct.create(sku: "RMAW16-17-001-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Nero-36").first
if ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Nero").present?
	pp = ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Nero").first
else
	pp = ParentProduct.create(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Nero", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Nero-37").first
if ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Nero").present?
	pp = ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Nero").first
else
	pp = ParentProduct.create(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Nero", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Nero-38").first
if ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Nero").present?
	pp = ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Nero").first
else
	pp = ParentProduct.create(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Nero", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Nero-39").first
if ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Nero").present?
	pp = ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Nero").first
else
	pp = ParentProduct.create(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Nero", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Nero-40").first
if ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Nero").present?
	pp = ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Nero").first
else
	pp = ParentProduct.create(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Nero", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Nero-41").first
if ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Nero").present?
	pp = ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Nero").first
else
	pp = ParentProduct.create(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Nero", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-06-HH55-HT45-P0-S-SU0-NA1-Nero/Oro-36").first
if ParentProduct.where(sku: "RMSS17-06-HH55-HT45-P0-S-SU0-NA1-Nero/Oro").present?
	pp = ParentProduct.where(sku: "RMSS17-06-HH55-HT45-P0-S-SU0-NA1-Nero/Oro").first
else
	pp = ParentProduct.create(sku: "RMSS17-06-HH55-HT45-P0-S-SU0-NA1-Nero/Oro", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-06-HH55-HT45-P0-S-SU0-NA1-Nero/Oro-37").first
if ParentProduct.where(sku: "RMSS17-06-HH55-HT45-P0-S-SU0-NA1-Nero/Oro").present?
	pp = ParentProduct.where(sku: "RMSS17-06-HH55-HT45-P0-S-SU0-NA1-Nero/Oro").first
else
	pp = ParentProduct.create(sku: "RMSS17-06-HH55-HT45-P0-S-SU0-NA1-Nero/Oro", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-06-HH55-HT45-P0-S-SU0-NA1-Nero/Oro-38").first
if ParentProduct.where(sku: "RMSS17-06-HH55-HT45-P0-S-SU0-NA1-Nero/Oro").present?
	pp = ParentProduct.where(sku: "RMSS17-06-HH55-HT45-P0-S-SU0-NA1-Nero/Oro").first
else
	pp = ParentProduct.create(sku: "RMSS17-06-HH55-HT45-P0-S-SU0-NA1-Nero/Oro", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-06-HH55-HT45-P0-S-SU0-NA1-Nero/Oro-39").first
if ParentProduct.where(sku: "RMSS17-06-HH55-HT45-P0-S-SU0-NA1-Nero/Oro").present?
	pp = ParentProduct.where(sku: "RMSS17-06-HH55-HT45-P0-S-SU0-NA1-Nero/Oro").first
else
	pp = ParentProduct.create(sku: "RMSS17-06-HH55-HT45-P0-S-SU0-NA1-Nero/Oro", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-06-HH55-HT45-P0-S-SU0-NA1-Nero/Oro-40").first
if ParentProduct.where(sku: "RMSS17-06-HH55-HT45-P0-S-SU0-NA1-Nero/Oro").present?
	pp = ParentProduct.where(sku: "RMSS17-06-HH55-HT45-P0-S-SU0-NA1-Nero/Oro").first
else
	pp = ParentProduct.create(sku: "RMSS17-06-HH55-HT45-P0-S-SU0-NA1-Nero/Oro", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-06-HH55-HT45-P0-S-SU0-NA1-Nero/Oro-41").first
if ParentProduct.where(sku: "RMSS17-06-HH55-HT45-P0-S-SU0-NA1-Nero/Oro").present?
	pp = ParentProduct.where(sku: "RMSS17-06-HH55-HT45-P0-S-SU0-NA1-Nero/Oro").first
else
	pp = ParentProduct.create(sku: "RMSS17-06-HH55-HT45-P0-S-SU0-NA1-Nero/Oro", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Ribes-36").first
if ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Ribes").present?
	pp = ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Ribes").first
else
	pp = ParentProduct.create(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Ribes", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Ribes-37").first
if ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Ribes").present?
	pp = ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Ribes").first
else
	pp = ParentProduct.create(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Ribes", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Ribes-38").first
if ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Ribes").present?
	pp = ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Ribes").first
else
	pp = ParentProduct.create(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Ribes", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Ribes-39").first
if ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Ribes").present?
	pp = ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Ribes").first
else
	pp = ParentProduct.create(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Ribes", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Ribes-40").first
if ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Ribes").present?
	pp = ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Ribes").first
else
	pp = ParentProduct.create(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Ribes", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Ribes-41").first
if ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Ribes").present?
	pp = ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Ribes").first
else
	pp = ParentProduct.create(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Ribes", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Bolgheri-36").first
if ParentProduct.where(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Bolgheri").present?
	pp = ParentProduct.where(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Bolgheri").first
else
	pp = ParentProduct.create(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Bolgheri", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Bolgheri-37").first
if ParentProduct.where(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Bolgheri").present?
	pp = ParentProduct.where(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Bolgheri").first
else
	pp = ParentProduct.create(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Bolgheri", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Bolgheri-38").first
if ParentProduct.where(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Bolgheri").present?
	pp = ParentProduct.where(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Bolgheri").first
else
	pp = ParentProduct.create(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Bolgheri", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Bolgheri-39").first
if ParentProduct.where(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Bolgheri").present?
	pp = ParentProduct.where(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Bolgheri").first
else
	pp = ParentProduct.create(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Bolgheri", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Bolgheri-40").first
if ParentProduct.where(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Bolgheri").present?
	pp = ParentProduct.where(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Bolgheri").first
else
	pp = ParentProduct.create(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Bolgheri", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Bolgheri-41").first
if ParentProduct.where(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Bolgheri").present?
	pp = ParentProduct.where(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Bolgheri").first
else
	pp = ParentProduct.create(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Bolgheri", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-05-HH85-HT18-P0-E-SU0-NA1-Navy/Rock-36").first
if ParentProduct.where(sku: "RMSS16-05-HH85-HT18-P0-E-SU0-NA1-Navy/Rock").present?
	pp = ParentProduct.where(sku: "RMSS16-05-HH85-HT18-P0-E-SU0-NA1-Navy/Rock").first
else
	pp = ParentProduct.create(sku: "RMSS16-05-HH85-HT18-P0-E-SU0-NA1-Navy/Rock", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-05-HH85-HT18-P0-E-SU0-NA1-Navy/Rock-37").first
if ParentProduct.where(sku: "RMSS16-05-HH85-HT18-P0-E-SU0-NA1-Navy/Rock").present?
	pp = ParentProduct.where(sku: "RMSS16-05-HH85-HT18-P0-E-SU0-NA1-Navy/Rock").first
else
	pp = ParentProduct.create(sku: "RMSS16-05-HH85-HT18-P0-E-SU0-NA1-Navy/Rock", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-05-HH85-HT18-P0-E-SU0-NA1-Navy/Rock-38").first
if ParentProduct.where(sku: "RMSS16-05-HH85-HT18-P0-E-SU0-NA1-Navy/Rock").present?
	pp = ParentProduct.where(sku: "RMSS16-05-HH85-HT18-P0-E-SU0-NA1-Navy/Rock").first
else
	pp = ParentProduct.create(sku: "RMSS16-05-HH85-HT18-P0-E-SU0-NA1-Navy/Rock", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-05-HH85-HT18-P0-E-SU0-NA1-Navy/Rock-39").first
if ParentProduct.where(sku: "RMSS16-05-HH85-HT18-P0-E-SU0-NA1-Navy/Rock").present?
	pp = ParentProduct.where(sku: "RMSS16-05-HH85-HT18-P0-E-SU0-NA1-Navy/Rock").first
else
	pp = ParentProduct.create(sku: "RMSS16-05-HH85-HT18-P0-E-SU0-NA1-Navy/Rock", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-05-HH85-HT18-P0-E-SU0-NA1-Navy/Rock-40").first
if ParentProduct.where(sku: "RMSS16-05-HH85-HT18-P0-E-SU0-NA1-Navy/Rock").present?
	pp = ParentProduct.where(sku: "RMSS16-05-HH85-HT18-P0-E-SU0-NA1-Navy/Rock").first
else
	pp = ParentProduct.create(sku: "RMSS16-05-HH85-HT18-P0-E-SU0-NA1-Navy/Rock", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-05-HH85-HT18-P0-E-SU0-NA1-Navy/Rock-41").first
if ParentProduct.where(sku: "RMSS16-05-HH85-HT18-P0-E-SU0-NA1-Navy/Rock").present?
	pp = ParentProduct.where(sku: "RMSS16-05-HH85-HT18-P0-E-SU0-NA1-Navy/Rock").first
else
	pp = ParentProduct.create(sku: "RMSS16-05-HH85-HT18-P0-E-SU0-NA1-Navy/Rock", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Verde-36").first
if ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Verde").present?
	pp = ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Verde").first
else
	pp = ParentProduct.create(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Verde", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Verde-37").first
if ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Verde").present?
	pp = ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Verde").first
else
	pp = ParentProduct.create(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Verde", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Verde-38").first
if ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Verde").present?
	pp = ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Verde").first
else
	pp = ParentProduct.create(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Verde", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Verde-39").first
if ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Verde").present?
	pp = ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Verde").first
else
	pp = ParentProduct.create(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Verde", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Verde-40").first
if ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Verde").present?
	pp = ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Verde").first
else
	pp = ParentProduct.create(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Verde", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Verde-41").first
if ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Verde").present?
	pp = ParentProduct.where(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Verde").first
else
	pp = ParentProduct.create(sku: "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Verde", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Wine-36").first
if ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Wine").present?
	pp = ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Wine").first
else
	pp = ParentProduct.create(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Wine", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Wine-37").first
if ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Wine").present?
	pp = ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Wine").first
else
	pp = ParentProduct.create(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Wine", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Wine-38").first
if ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Wine").present?
	pp = ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Wine").first
else
	pp = ParentProduct.create(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Wine", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Wine-39").first
if ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Wine").present?
	pp = ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Wine").first
else
	pp = ParentProduct.create(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Wine", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Wine-40").first
if ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Wine").present?
	pp = ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Wine").first
else
	pp = ParentProduct.create(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Wine", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Wine-41").first
if ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Wine").present?
	pp = ParentProduct.where(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Wine").first
else
	pp = ParentProduct.create(sku: "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Wine", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Grey/Silver-36").first
if ParentProduct.where(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Grey/Silver").present?
	pp = ParentProduct.where(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Grey/Silver").first
else
	pp = ParentProduct.create(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Grey/Silver", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Grey/Silver-37").first
if ParentProduct.where(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Grey/Silver").present?
	pp = ParentProduct.where(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Grey/Silver").first
else
	pp = ParentProduct.create(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Grey/Silver", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Grey/Silver-38").first
if ParentProduct.where(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Grey/Silver").present?
	pp = ParentProduct.where(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Grey/Silver").first
else
	pp = ParentProduct.create(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Grey/Silver", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Grey/Silver-39").first
if ParentProduct.where(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Grey/Silver").present?
	pp = ParentProduct.where(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Grey/Silver").first
else
	pp = ParentProduct.create(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Grey/Silver", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Grey/Silver-40").first
if ParentProduct.where(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Grey/Silver").present?
	pp = ParentProduct.where(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Grey/Silver").first
else
	pp = ParentProduct.create(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Grey/Silver", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Grey/Silver-41").first
if ParentProduct.where(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Grey/Silver").present?
	pp = ParentProduct.where(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Grey/Silver").first
else
	pp = ParentProduct.create(sku: "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Grey/Silver", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW-17-18-11-Red-36").first
if ParentProduct.where(sku: "RMAW-17-18-11-Red").present?
	pp = ParentProduct.where(sku: "RMAW-17-18-11-Red").first
else
	pp = ParentProduct.create(sku: "RMAW-17-18-11-Red", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW-17-18-11-Red-37").first
if ParentProduct.where(sku: "RMAW-17-18-11-Red").present?
	pp = ParentProduct.where(sku: "RMAW-17-18-11-Red").first
else
	pp = ParentProduct.create(sku: "RMAW-17-18-11-Red", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW-17-18-11-Red-38").first
if ParentProduct.where(sku: "RMAW-17-18-11-Red").present?
	pp = ParentProduct.where(sku: "RMAW-17-18-11-Red").first
else
	pp = ParentProduct.create(sku: "RMAW-17-18-11-Red", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW-17-18-11-Red-39").first
if ParentProduct.where(sku: "RMAW-17-18-11-Red").present?
	pp = ParentProduct.where(sku: "RMAW-17-18-11-Red").first
else
	pp = ParentProduct.create(sku: "RMAW-17-18-11-Red", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW-17-18-11-Red-40").first
if ParentProduct.where(sku: "RMAW-17-18-11-Red").present?
	pp = ParentProduct.where(sku: "RMAW-17-18-11-Red").first
else
	pp = ParentProduct.create(sku: "RMAW-17-18-11-Red", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW-17-18-11-Red-41").first
if ParentProduct.where(sku: "RMAW-17-18-11-Red").present?
	pp = ParentProduct.where(sku: "RMAW-17-18-11-Red").first
else
	pp = ParentProduct.create(sku: "RMAW-17-18-11-Red", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW-17-18-11-Black-36").first
if ParentProduct.where(sku: "RMAW-17-18-11-Black").present?
	pp = ParentProduct.where(sku: "RMAW-17-18-11-Black").first
else
	pp = ParentProduct.create(sku: "RMAW-17-18-11-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW-17-18-11-Black-37").first
if ParentProduct.where(sku: "RMAW-17-18-11-Black").present?
	pp = ParentProduct.where(sku: "RMAW-17-18-11-Black").first
else
	pp = ParentProduct.create(sku: "RMAW-17-18-11-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW-17-18-11-Black-38").first
if ParentProduct.where(sku: "RMAW-17-18-11-Black").present?
	pp = ParentProduct.where(sku: "RMAW-17-18-11-Black").first
else
	pp = ParentProduct.create(sku: "RMAW-17-18-11-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW-17-18-11-Black-39").first
if ParentProduct.where(sku: "RMAW-17-18-11-Black").present?
	pp = ParentProduct.where(sku: "RMAW-17-18-11-Black").first
else
	pp = ParentProduct.create(sku: "RMAW-17-18-11-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW-17-18-11-Black-40").first
if ParentProduct.where(sku: "RMAW-17-18-11-Black").present?
	pp = ParentProduct.where(sku: "RMAW-17-18-11-Black").first
else
	pp = ParentProduct.create(sku: "RMAW-17-18-11-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW-17-18-11-Black-41").first
if ParentProduct.where(sku: "RMAW-17-18-11-Black").present?
	pp = ParentProduct.where(sku: "RMAW-17-18-11-Black").first
else
	pp = ParentProduct.create(sku: "RMAW-17-18-11-Black", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW-17-18-02-Gold-36").first
if ParentProduct.where(sku: "RMAW-17-18-02-Gold").present?
	pp = ParentProduct.where(sku: "RMAW-17-18-02-Gold").first
else
	pp = ParentProduct.create(sku: "RMAW-17-18-02-Gold", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW-17-18-02-Gold-37").first
if ParentProduct.where(sku: "RMAW-17-18-02-Gold").present?
	pp = ParentProduct.where(sku: "RMAW-17-18-02-Gold").first
else
	pp = ParentProduct.create(sku: "RMAW-17-18-02-Gold", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW-17-18-02-Gold-38").first
if ParentProduct.where(sku: "RMAW-17-18-02-Gold").present?
	pp = ParentProduct.where(sku: "RMAW-17-18-02-Gold").first
else
	pp = ParentProduct.create(sku: "RMAW-17-18-02-Gold", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW-17-18-02-Gold-39").first
if ParentProduct.where(sku: "RMAW-17-18-02-Gold").present?
	pp = ParentProduct.where(sku: "RMAW-17-18-02-Gold").first
else
	pp = ParentProduct.create(sku: "RMAW-17-18-02-Gold", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW-17-18-02-Gold-40").first
if ParentProduct.where(sku: "RMAW-17-18-02-Gold").present?
	pp = ParentProduct.where(sku: "RMAW-17-18-02-Gold").first
else
	pp = ParentProduct.create(sku: "RMAW-17-18-02-Gold", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW-17-18-02-Gold-41").first
if ParentProduct.where(sku: "RMAW-17-18-02-Gold").present?
	pp = ParentProduct.where(sku: "RMAW-17-18-02-Gold").first
else
	pp = ParentProduct.create(sku: "RMAW-17-18-02-Gold", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW-17-18-02-Burgundy-36").first
if ParentProduct.where(sku: "RMAW-17-18-02-Burgundy").present?
	pp = ParentProduct.where(sku: "RMAW-17-18-02-Burgundy").first
else
	pp = ParentProduct.create(sku: "RMAW-17-18-02-Burgundy", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW-17-18-02-Burgundy-37").first
if ParentProduct.where(sku: "RMAW-17-18-02-Burgundy").present?
	pp = ParentProduct.where(sku: "RMAW-17-18-02-Burgundy").first
else
	pp = ParentProduct.create(sku: "RMAW-17-18-02-Burgundy", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW-17-18-02-Burgundy-38").first
if ParentProduct.where(sku: "RMAW-17-18-02-Burgundy").present?
	pp = ParentProduct.where(sku: "RMAW-17-18-02-Burgundy").first
else
	pp = ParentProduct.create(sku: "RMAW-17-18-02-Burgundy", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW-17-18-02-Burgundy-39").first
if ParentProduct.where(sku: "RMAW-17-18-02-Burgundy").present?
	pp = ParentProduct.where(sku: "RMAW-17-18-02-Burgundy").first
else
	pp = ParentProduct.create(sku: "RMAW-17-18-02-Burgundy", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW-17-18-02-Burgundy-40").first
if ParentProduct.where(sku: "RMAW-17-18-02-Burgundy").present?
	pp = ParentProduct.where(sku: "RMAW-17-18-02-Burgundy").first
else
	pp = ParentProduct.create(sku: "RMAW-17-18-02-Burgundy", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMAW-17-18-02-Burgundy-41").first
if ParentProduct.where(sku: "RMAW-17-18-02-Burgundy").present?
	pp = ParentProduct.where(sku: "RMAW-17-18-02-Burgundy").first
else
	pp = ParentProduct.create(sku: "RMAW-17-18-02-Burgundy", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-09-HH55-HH45-P0-S-SU1-NA0-Ribes/Rosso-36").first
if ParentProduct.where(sku: "RMSS17-09-HH55-HH45-P0-S-SU1-NA0-Ribes/Rosso").present?
	pp = ParentProduct.where(sku: "RMSS17-09-HH55-HH45-P0-S-SU1-NA0-Ribes/Rosso").first
else
	pp = ParentProduct.create(sku: "RMSS17-09-HH55-HH45-P0-S-SU1-NA0-Ribes/Rosso", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-09-HH55-HH45-P0-S-SU1-NA0-Ribes/Rosso-37").first
if ParentProduct.where(sku: "RMSS17-09-HH55-HH45-P0-S-SU1-NA0-Ribes/Rosso").present?
	pp = ParentProduct.where(sku: "RMSS17-09-HH55-HH45-P0-S-SU1-NA0-Ribes/Rosso").first
else
	pp = ParentProduct.create(sku: "RMSS17-09-HH55-HH45-P0-S-SU1-NA0-Ribes/Rosso", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-09-HH55-HH45-P0-S-SU1-NA0-Ribes/Rosso-38").first
if ParentProduct.where(sku: "RMSS17-09-HH55-HH45-P0-S-SU1-NA0-Ribes/Rosso").present?
	pp = ParentProduct.where(sku: "RMSS17-09-HH55-HH45-P0-S-SU1-NA0-Ribes/Rosso").first
else
	pp = ParentProduct.create(sku: "RMSS17-09-HH55-HH45-P0-S-SU1-NA0-Ribes/Rosso", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-09-HH55-HH45-P0-S-SU1-NA0-Ribes/Rosso-39").first
if ParentProduct.where(sku: "RMSS17-09-HH55-HH45-P0-S-SU1-NA0-Ribes/Rosso").present?
	pp = ParentProduct.where(sku: "RMSS17-09-HH55-HH45-P0-S-SU1-NA0-Ribes/Rosso").first
else
	pp = ParentProduct.create(sku: "RMSS17-09-HH55-HH45-P0-S-SU1-NA0-Ribes/Rosso", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-09-HH55-HH45-P0-S-SU1-NA0-Ribes/Rosso-40").first
if ParentProduct.where(sku: "RMSS17-09-HH55-HH45-P0-S-SU1-NA0-Ribes/Rosso").present?
	pp = ParentProduct.where(sku: "RMSS17-09-HH55-HH45-P0-S-SU1-NA0-Ribes/Rosso").first
else
	pp = ParentProduct.create(sku: "RMSS17-09-HH55-HH45-P0-S-SU1-NA0-Ribes/Rosso", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!

product = Product.where(SKU: "RMSS17-09-HH55-HH45-P0-S-SU1-NA0-Ribes/Rosso-41").first
if ParentProduct.where(sku: "RMSS17-09-HH55-HH45-P0-S-SU1-NA0-Ribes/Rosso").present?
	pp = ParentProduct.where(sku: "RMSS17-09-HH55-HH45-P0-S-SU1-NA0-Ribes/Rosso").first
else
	pp = ParentProduct.create(sku: "RMSS17-09-HH55-HH45-P0-S-SU1-NA0-Ribes/Rosso", usual_production_price: 80)
end
p pp.sku
product.parent_product = pp
product.save!


