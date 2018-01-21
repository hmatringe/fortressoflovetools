require 'json'
json_parsed = JSON.parse('{"body": {
		"id": "11485",
		"parent_id": 0,
		"number": "11485",
		"order_key": "wc_order_5a4b55564e014",
		"created_via": "checkout",
		"version": "3.1.2",
		"status": "processing",
		"currency": "DKK",
		"date_created": "2018-01-02T10:48:06",
		"date_created_gmt": "2018-01-02T09:48:06",
		"date_modified": "2018-01-02T10:48:11",
		"date_modified_gmt": "2018-01-02T09:48:11",
		"discount_total": "0.00",
		"discount_tax": "0.00",
		"shipping_total": "0.00",
		"shipping_tax": "0.00",
		"cart_tax": "440.00",
		"total": "2200.00",
		"total_tax": "440.00",
		"prices_include_tax": true,
		"customer_id": 0,
		"customer_ip_address": "80.62.117.134",
		"customer_user_agent": "mozilla/5.0 (iphone; cpu iphone os 11_1_2 like mac os x) applewebkit/604.3.5 (khtml, like gecko) version/11.0 mobile/15b202 safari/604.1",
		"customer_note": "",
		"billing": {
			"first_name": "Danske Spil",
			"last_name": "Susanne Koch",
			"company": "",
			"address_1": "Korsdalsvej 135",
			"address_2": "",
			"city": "Broendby",
			"state": "",
			"postcode": "2605",
			"country": "DK",
			"email": "smk@danskespil.dk",
			"phone": "30308889"
		},
		"shipping": {
			"first_name": "Danske Spil",
			"last_name": "Susanne Koch",
			"company": "",
			"address_1": "Korsdalsvej 135",
			"address_2": "",
			"city": "Broendby",
			"state": "",
			"postcode": "2605",
			"country": "DK"
		},
		"payment_method": "stripe",
		"payment_method_title": "Credit Card",
		"transaction_id": "ch_1BfmNQJczEAsne03Zwqdgsqf",
		"date_paid": "2018-01-02T10:48:11",
		"date_paid_gmt": "2018-01-02T09:48:11",
		"date_completed": null,
		"date_completed_gmt": null,
		"cart_hash": "64291015a618cc97c42bf797273d245e",
		"meta_data": [{
			"id": 156847,
			"key": "mailchimp_woocommerce_is_subscribed",
			"value": "0"
		}, {
			"id": 156848,
			"key": "_stripe_card_id",
			"value": "tok_1BfmNLJczEAsne032xFKs81A"
		}, {
			"id": 156849,
			"key": "_stripe_charge_id",
			"value": "ch_1BfmNQJczEAsne03Zwqdgsqf"
		}, {
			"id": 156850,
			"key": "_stripe_charge_captured",
			"value": "yes"
		}, {
			"id": 156851,
			"key": "Stripe Fee",
			"value": "4.30"
		}, {
			"id": 156852,
			"key": "Net Revenue From Stripe",
			"value": "285.30"
		}, {
			"id": 156853,
			"key": "_wcj_invoicing_invoice_number_id",
			"value": "11485"
		}, {
			"id": 156854,
			"key": "_wcj_invoicing_invoice_date",
			"value": "1514890092"
		}, {
			"id": 156855,
			"key": "_download_permissions_granted",
			"value": "yes"
		}, {
			"id": 156858,
			"key": "_order_stock_reduced",
			"value": "yes"
		}],
		"line_items": [{
			"id": 6214,
			"name": "sophie - 38",
			"product_id": 10607,
			"variation_id": 10610,
			"quantity": 1,
			"tax_class": "",
			"subtotal": "1760.00",
			"subtotal_tax": "440.00",
			"total": "1760.00",
			"total_tax": "440.00",
			"taxes": [{
				"id": 10,
				"total": "440",
				"subtotal": "440"
			}],
			"meta_data": [{
				"id": 38792,
				"key": "pa_size",
				"value": "38"
			}],
			"sku": "5113036005262",
			"price": 1760
		}],
		"tax_lines": [{
			"id": 6216,
			"rate_code": "DK-VALUE ADDED TAX DK - MOMS-1",
			"rate_id": 10,
			"label": "Value Added Tax DK - MOMS",
			"compound": false,
			"tax_total": "440.00",
			"shipping_tax_total": "0.00",
			"meta_data": []
		}],
		"shipping_lines": [{
			"id": 6215,
			"method_title": "Free shipping",
			"method_id": "free_shipping:2",
			"total": "0.00",
			"total_tax": "0.00",
			"taxes": [],
			"meta_data": [{
				"id": 38797,
				"key": "Items",
				"value": "sophie - 38 &times; 1"
			}]
		}],
		"fee_lines": [],
		"coupon_lines": [],
		"refunds": []
	}
}')
# p json_parsed.class
p json_parsed["body"]["line_items"][0]
# p json_parsed["body"]["date_created"]
# p json_parsed["body"]["billing"]["country"]
# p json_parsed["body"]["id"]
# p Product.where(EAN: "5113036005262")