class StatsController < ApplicationController



	def main_stats
    sols ||= SalesOrderLine.all
    
    # raise
    # if params[:filters] && 
    #   filter_start_date = Date.parse(params[:filters]["date_start(1i)"] + "-" + params[:filters]["date_start(2i)"] + "-" + params[:filters]["date_start(3i)"])
    #   filter_end_date = Date.parse(params[:filters]["date_end(1i)"] + "-" + params[:filters]["date_end(2i)"] + "-" + params[:filters]["date_end(3i)"])
    #   sols ||= SalesOrderLine.where('date BETWEEN ? AND ?', filter_start_date.beginning_of_day, filter_end_date.end_of_day)
    # else
    #   sols ||= SalesOrderLine.all
    # end

    # sortir below du switch au dessus sinon sols.size = O lorsqu'on essaie d'appliquer les autres filtres
    # sols ||= SalesOrderLine.all

    # to form
    @coupons ||= Coupon.all
    
    if params[:filters] && params[:filters][:coupon] && params[:filters][:coupon] != "no coupon"
      @selected_coupon = params[:filters][:coupon]
      # filtering sol with coupon_lines
      sols = sols.reject { |sol| sol.coupon_lines.size == 0 }
      # filtering sol with coupon = user's selected coupon
      sols = sols.select { |sol| sol.sol_coupons.include?(@selected_coupon) }
    end
    
    # filter_country = params[:filters][:country]
    
      
    total_sold_units_hash = sols.each_with_object(Hash.new(0)) { |sol, h| h[sol.product.SKU] += sol.qtty.to_i }
    total_sales_hash = sols.each_with_object(Hash.new(0)) { |sol, h| h[sol.product.SKU] += sol.total.to_i }

    @total_sold_units = total_sold_units_hash.values.reduce(:+)
    @total_sales = total_sales_hash.values.reduce(:+)

    @sales_by_SKU_title = "Sales / SKU"
    @sales_by_SKU = total_sold_units_hash.to_a.sort_by { |_key, value| value }.reverse

    @sales_by_SKU_bars_title = 'Sales by SKU'
    @sales_by_SKU_bars = total_sales_hash.to_a.sort_by { |_key, value| value }.reverse.unshift(['SKU', 'sales'])

  	@sales_by_size_title = ""
  	@sales_by_size = ""
  	
  	@sales_by_heel_height_title = ""
  	@sales_by_heel_height = ""
  	
  	@sales_by_heel_thickness_title = ""
  	@sales_by_heel_thickness = ""
  	
  	@sales_by_platform_or_boolean_title = ""
  	@sales_by_platform_or_boolean = ""
  	
  	@sales_by_shoe_type_title = ""
  	@sales_by_shoe_type = ""
  	
  	@sales_by_closing_type_title = ""
  	@sales_by_closing_type = ""
  	
  	@sales_by_supplier_title = ""
  	@sales_by_supplier = ""

  	@sales_by_color_title = ""
  	@sales_by_color = ""
  	
  	@sales_by_structure_title = ""
  	@sales_by_structure = ""
	end
end
