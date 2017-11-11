require 'date'
require_relative 'app/models/sales_order_line'
sales_lines = [
  {
    "SKU": "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Black-40",
    "qtty": 1,
    "Order Date": "2017-10-12"
  },
  {
    "SKU": "RMSS16-005-Black-36",
    "qtty": 1,
    "Order Date": "2017-10-12"
  },
  {
    "SKU": "RMSS16-001-Black-37",
    "qtty": 1,
    "Order Date": "2017-10-12"
  },
  {
    "SKU": "RMSS16-005-Black-36",
    "qtty": 1,
    "Order Date": "2017-10-13"
  },
  {
    "SKU": "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Shadow-36",
    "qtty": 1,
    "Order Date": "2017-10-13"
  },
  {
    "SKU": "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Nero-39",
    "qtty": 1,
    "Order Date": "2017-10-13"
  },
  {
    "SKU": "RMSS16-001-Black-40",
    "qtty": 1,
    "Order Date": "2017-10-13"
  },
  {
    "SKU": "RMSS16-005-Black-39",
    "qtty": 1,
    "Order Date": "2017-10-13"
  },
  {
    "SKU": "RMSS16-001-Black-39",
    "qtty": 1,
    "Order Date": "2017-10-14"
  },
  {
    "SKU": "RMAW16-17-001-Cordovan-39",
    "qtty": 1,
    "Order Date": "2017-10-14"
  },
  {
    "SKU": "RMSS16-005-Black-37",
    "qtty": 1,
    "Order Date": "2017-10-14"
  },
  {
    "SKU": "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero-39",
    "qtty": 1,
    "Order Date": "2017-10-14"
  },
  {
    "SKU": "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Midnight-41",
    "qtty": 1,
    "Order Date": "2017-10-14"
  },
  {
    "SKU": "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Wine-41",
    "qtty": 1,
    "Order Date": "2017-10-16"
  },
  {
    "SKU": "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Grey-39",
    "qtty": 1,
    "Order Date": "2017-10-16"
  },
  {
    "SKU": "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Ribes-38",
    "qtty": 1,
    "Order Date": "2017-10-17"
  },
  {
    "SKU": "RMAW16-17-001-Black-39",
    "qtty": 1,
    "Order Date": "2017-10-17"
  },
  {
    "SKU": "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero-38",
    "qtty": 1,
    "Order Date": "2017-10-17"
  },
  {
    "SKU": "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Ribes-38",
    "qtty": 1,
    "Order Date": "2017-10-17"
  },
  {
    "SKU": "RMSS16-001-Black-40",
    "qtty": 1,
    "Order Date": "2017-10-17"
  },
  {
    "SKU": "RMSS16-005-Black-37",
    "qtty": 1,
    "Order Date": "2017-10-17"
  },
  {
    "SKU": "RMSS16-001-Gold/Blush-39",
    "qtty": 1,
    "Order Date": "2017-10-18"
  },
  {
    "SKU": "RMSS16-005-Blue-39",
    "qtty": 1,
    "Order Date": "2017-10-18"
  },
  {
    "SKU": "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Black-41",
    "qtty": 1,
    "Order Date": "2017-10-18"
  },
  {
    "SKU": "RMSS16-005-Black-41",
    "qtty": 1,
    "Order Date": "2017-10-18"
  },
  {
    "SKU": "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero-39",
    "qtty": 1,
    "Order Date": "2017-10-18"
  },
  {
    "SKU": "RMSS16-001-Black-39",
    "qtty": 1,
    "Order Date": "2017-10-19"
  },
  {
    "SKU": "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Midnight-39",
    "qtty": 1,
    "Order Date": "2017-10-19"
  },
  {
    "SKU": "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero-36",
    "qtty": 1,
    "Order Date": "2017-10-19"
  },
  {
    "SKU": "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Ribes-39",
    "qtty": 1,
    "Order Date": "2017-10-19"
  },
  {
    "SKU": "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero-37",
    "qtty": 1,
    "Order Date": "2017-10-19"
  },
  {
    "SKU": "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero-37",
    "qtty": 1,
    "Order Date": "2017-10-20"
  },
  {
    "SKU": "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Wine-36",
    "qtty": 1,
    "Order Date": "2017-10-20"
  },
  {
    "SKU": "RMSS17-06-HH55-HT45-P0-S-SU0-NA1-Nero/Oro-36",
    "qtty": 1,
    "Order Date": "2017-10-20"
  },
  {
    "SKU": "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Wine-39",
    "qtty": 1,
    "Order Date": "2017-10-20"
  },
  {
    "SKU": "RMSS16-001-Black-38",
    "qtty": 1,
    "Order Date": "2017-10-20"
  },
  {
    "SKU": "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Nero-40",
    "qtty": 1,
    "Order Date": "2017-10-21"
  },
  {
    "SKU": "RMSS16-05-HH85-HT18-P0-E-SU0-NA1-Navy/Rock-38",
    "qtty": 1,
    "Order Date": "2017-10-21"
  },
  {
    "SKU": "RMSS16-005-Black-39",
    "qtty": 1,
    "Order Date": "2017-10-21"
  },
  {
    "SKU": "RMSS17-06-HH55-HT45-P0-S-SU0-NA1-Nero/Oro-36",
    "qtty": 1,
    "Order Date": "2017-10-21"
  },
  {
    "SKU": "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Bolgheri-39",
    "qtty": 1,
    "Order Date": "2017-10-22"
  },
  {
    "SKU": "RMSS16-005-Black-37",
    "qtty": 1,
    "Order Date": "2017-10-22"
  },
  {
    "SKU": "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero-39",
    "qtty": 1,
    "Order Date": "2017-10-22"
  },
  {
    "SKU": "RMAW16-17-003-Black-40",
    "qtty": 1,
    "Order Date": "2017-10-23"
  },
  {
    "SKU": "RMSS17-06-HH55-HT45-P0-S-SU0-NA1-Nero/Oro-37",
    "qtty": 1,
    "Order Date": "2017-10-23"
  },
  {
    "SKU": "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Verde-38",
    "qtty": 1,
    "Order Date": "2017-10-23"
  },
  {
    "SKU": "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Black-38",
    "qtty": 1,
    "Order Date": "2017-10-23"
  },
  {
    "SKU": "RMAW16-17-003-Eclipse-39",
    "qtty": 1,
    "Order Date": "2017-10-23"
  },
  {
    "SKU": "RMAW16-17-003-Eclipse-39",
    "qtty": 1,
    "Order Date": "2017-10-23"
  },
  {
    "SKU": "RMSS16-005-Blue-36",
    "qtty": 1,
    "Order Date": "2017-10-23"
  },
  {
    "SKU": "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Verde-38",
    "qtty": 1,
    "Order Date": "2017-10-24"
  },
  {
    "SKU": "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Ribes-39",
    "qtty": 1,
    "Order Date": "2017-10-24"
  },
  {
    "SKU": "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Nero-40",
    "qtty": 1,
    "Order Date": "2017-10-24"
  },
  {
    "SKU": "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Black-40",
    "qtty": 1,
    "Order Date": "2017-10-25"
  },
  {
    "SKU": "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero-39",
    "qtty": 1,
    "Order Date": "2017-10-25"
  },
  {
    "SKU": "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Verde-37",
    "qtty": 1,
    "Order Date": "2017-10-25"
  },
  {
    "SKU": "RMSS16-005-Blue-40",
    "qtty": 1,
    "Order Date": "2017-10-25"
  },
  {
    "SKU": "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Grey/Silver-37",
    "qtty": 1,
    "Order Date": "2017-10-26"
  },
  {
    "SKU": "RMSS16-005-Blue-40",
    "qtty": 1,
    "Order Date": "2017-10-26"
  },
  {
    "SKU": "RMSS17-06-HH55-HT45-P0-S-SU0-NA1-Nero/Oro-38",
    "qtty": 1,
    "Order Date": "2017-10-26"
  },
  {
    "SKU": "RMSS17-06-HH55-HT45-P0-S-SU0-NA1-Nero/Oro-38",
    "qtty": 1,
    "Order Date": "2017-10-26"
  },
  {
    "SKU": "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero-39",
    "qtty": 1,
    "Order Date": "2017-10-26"
  },
  {
    "SKU": "RMSS16-001-Black-38",
    "qtty": 1,
    "Order Date": "2017-10-26"
  },
  {
    "SKU": "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Midnight-37",
    "qtty": 1,
    "Order Date": "2017-10-27"
  },
  {
    "SKU": "RMSS17-06-HH55-HT45-P0-S-SU0-NA1-Nero/Oro-38",
    "qtty": 1,
    "Order Date": "2017-10-27"
  },
  {
    "SKU": "RMSS17-06-HH55-HT45-P0-S-SU0-NA1-Nero/Oro-37",
    "qtty": 1,
    "Order Date": "2017-10-27"
  },
  {
    "SKU": "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero-37",
    "qtty": 1,
    "Order Date": "2017-10-27"
  },
  {
    "SKU": "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Shadow-37",
    "qtty": 1,
    "Order Date": "2017-10-27"
  },
  {
    "SKU": "RMSS16-001-Black-40",
    "qtty": 1,
    "Order Date": "2017-10-27"
  },
  {
    "SKU": "RMSS16-005-Black-38",
    "qtty": 1,
    "Order Date": "2017-10-27"
  },
  {
    "SKU": "RMSS16-005-Black-41",
    "qtty": 1,
    "Order Date": "2017-10-27"
  },
  {
    "SKU": "RMSS16-005-Black-39",
    "qtty": 1,
    "Order Date": "2017-10-27"
  },
  {
    "SKU": "RMSS16-005-Blue-41",
    "qtty": 1,
    "Order Date": "2017-10-27"
  },
  {
    "SKU": "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Midnight-38",
    "qtty": 1,
    "Order Date": "2017-10-27"
  },
  {
    "SKU": "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero-39",
    "qtty": 1,
    "Order Date": "2017-10-27"
  },
  {
    "SKU": "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero-37",
    "qtty": 1,
    "Order Date": "2017-10-27"
  },
  {
    "SKU": "RMSS16-005-Black-38",
    "qtty": 1,
    "Order Date": "2017-10-27"
  },
  {
    "SKU": "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Wine-38",
    "qtty": 1,
    "Order Date": "2017-10-28"
  },
  {
    "SKU": "RMSS16-005-Blue-36",
    "qtty": 1,
    "Order Date": "2017-10-28"
  },
  {
    "SKU": "RMSS17-06-HH55-HT45-P0-S-SU0-NA1-Nero/Oro-39",
    "qtty": 1,
    "Order Date": "2017-10-28"
  },
  {
    "SKU": "RMSS16-005-Black-38",
    "qtty": 1,
    "Order Date": "2017-10-28"
  },
  {
    "SKU": "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Nero-36",
    "qtty": 1,
    "Order Date": "2017-10-29"
  },
  {
    "SKU": "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Midnight-40",
    "qtty": 1,
    "Order Date": "2017-10-29"
  },
  {
    "SKU": "RMSS16-005-Black-39",
    "qtty": 1,
    "Order Date": "2017-10-29"
  },
  {
    "SKU": "RMSS16-005-Black-38",
    "qtty": 1,
    "Order Date": "2017-10-29"
  },
  {
    "SKU": "RMSS16-001-Black-40",
    "qtty": 1,
    "Order Date": "2017-10-30"
  },
  {
    "SKU": "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero-38",
    "qtty": 1,
    "Order Date": "2017-10-30"
  },
  {
    "SKU": "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero-39",
    "qtty": 1,
    "Order Date": "2017-10-30"
  },
  {
    "SKU": "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero-36",
    "qtty": 1,
    "Order Date": "2017-10-30"
  },
  {
    "SKU": "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero-39",
    "qtty": 1,
    "Order Date": "2017-10-19"
  },
  {
    "SKU": "RMSS16-001-Black-36",
    "qtty": 1,
    "Order Date": "2017-10-19"
  },
  {
    "SKU": "RMSS16-005-Blue-39",
    "qtty": 1,
    "Order Date": "2017-10-19"
  },
  {
    "SKU": "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Bolgheri-38",
    "qtty": 1,
    "Order Date": "2017-10-19"
  },
  {
    "SKU": "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero-39",
    "qtty": 1,
    "Order Date": "2017-10-20"
  },
  {
    "SKU": "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero-38",
    "qtty": 1,
    "Order Date": "2017-10-20"
  },
  {
    "SKU": "RMSS16-05-HH65-HT11-P0-S-SU1-NA1-Bolgheri-39",
    "qtty": 1,
    "Order Date": "2017-10-20"
  },
  {
    "SKU": "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Nero-41",
    "qtty": 1,
    "Order Date": "2017-10-20"
  },
  {
    "SKU": "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero-38",
    "qtty": 1,
    "Order Date": "2017-10-23"
  },
  {
    "SKU": "RMSS16-005-Black-40",
    "qtty": 1,
    "Order Date": "2017-10-23"
  },
  {
    "SKU": "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero-41",
    "qtty": 1,
    "Order Date": "2017-10-23"
  },
  {
    "SKU": "RMSS16-005-Black-40",
    "qtty": 1,
    "Order Date": "2017-10-31"
  },
  {
    "SKU": "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero-37",
    "qtty": 1,
    "Order Date": "2017-10-24"
  },
  {
    "SKU": "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Nero-38",
    "qtty": 1,
    "Order Date": "2017-10-24"
  },
  {
    "SKU": "RMSS16-002-Blue-39",
    "qtty": 1,
    "Order Date": "2017-10-25"
  },
  {
    "SKU": "RMSS17-05-HH55-HT45-P0-S-SU1-NA0-Nero-40",
    "qtty": 1,
    "Order Date": "2017-10-27"
  },
  {
    "SKU": "RMSS16-001-Black-36",
    "qtty": 1,
    "Order Date": "2017-10-27"
  },
  {
    "SKU": "RMSS16-005-Black-40",
    "qtty": 1,
    "Order Date": "2017-10-27"
  },
  {
    "SKU": "RMSS16-001-Black-38",
    "qtty": 1,
    "Order Date": "2017-10-30"
  },
  {
    "SKU": "RMSS16-005-HH85-HT18-P0-E-SU1-NA0-Wine-40",
    "qtty": 1,
    "Order Date": "2017-10-30"
  },
  {
    "SKU": "RMSS17-09-HH75-HT11-P0-Z-SU1-NA0-Nero-39",
    "qtty": 1,
    "Order Date": "2017-10-30"
  },
  {
    "SKU": "RMSS16-05-HH85-HT18-P0-E-SU0-NA1-Navy/Rock-37",
    "qtty": 1,
    "Order Date": "2017-10-31"
  }
]

sales_lines.each do |sale|
	attr = {
		sku: sale[:SKU],
		date: Date.parse(sale[:"Order Date"]),
		qtty: sale[:qtty]
	}
	p SalesOrderLine.new(attr)
end