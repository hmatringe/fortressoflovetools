# require 'rest-client'
require 'json'
require 'open-uri'
require_relative "config/application"

url = "https://www.roccamore.com/wp-json/wc/v2/orders/?consumer_key=#{ENV['woo_commerce_key']}&consumer_secret=#{ENV['woo_commerce_secret']}"
orders_serialized = open(url).read
orders = JSON.parse(orders_serialized)

p orders

