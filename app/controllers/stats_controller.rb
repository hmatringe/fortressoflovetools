class StatsController < ApplicationController

	def main_stats
    # for the filters form
    @coupons ||= Coupon.all

    # shorthands
    @sols ||= SalesOrderLine.all
    @prmf = params[:filters]
    # raise    
    # filters
    # filter_date_start
    # filter_date_end
    filter_dates
    # filter_country
    filter_coupon
    
    # for the view table
      
    # for the view graphs
    total_sold_units_hash = @sols.each_with_object(Hash.new(0)) { |sol, h| h[sol.product.SKU] += sol.qtty.to_i }
    total_sales_hash = @sols.each_with_object(Hash.new(0)) { |sol, h| h[sol.product.SKU] += sol.total.to_i }

    @total_sold_units = total_sold_units_hash.values.reduce(:+)
    @total_sales = total_sales_hash.values.reduce(:+)

    @sales_by_SKU_title = "Sales / SKU"
    @sales_by_SKU = total_sold_units_hash.to_a.sort_by { |_key, value| value }.reverse

    @sales_by_SKU_bars_title = 'Sales by SKU'
    @sales_by_SKU_bars = total_sales_hash.to_a.sort_by { |_key, value| value }.reverse.unshift(['SKU', 'sales'])

  	# @sales_by_size_title = ""
  	# @sales_by_size = ""
  	
  	# @sales_by_heel_height_title = ""
  	# @sales_by_heel_height = ""
  	
  	# @sales_by_heel_thickness_title = ""
  	# @sales_by_heel_thickness = ""
  	
  	# @sales_by_platform_or_boolean_title = ""
  	# @sales_by_platform_or_boolean = ""
  	
  	# @sales_by_shoe_type_title = ""
  	# @sales_by_shoe_type = ""
  	
  	# @sales_by_closing_type_title = ""
  	# @sales_by_closing_type = ""
  	
  	# @sales_by_supplier_title = ""
  	# @sales_by_supplier = ""

  	# @sales_by_color_title = ""
  	# @sales_by_color = ""
  	
  	# @sales_by_structure_title = ""
  	# @sales_by_structure = ""
	end

  private 
  def filter_dates
    if @prmf && @prmf["dates"]
      dates = @prmf["dates"].split(/\s/)
      start_date = Date.parse(dates.first)
      end_date = Date.parse(dates.last)
      @sols = @sols.reject {|sol| sol.date < start_date}.reject {|sol| sol.date > end_date}
    end
  end

  def filter_date_start
    if @prmf && @prmf["date_start(1i)"]
      concat_start = @prmf["date_start(1i)"] + "-" + @prmf["date_start(2i)"] + "-" + @prmf["date_start(3i)"]
      filter_start_date = Date.parse(concat_start)
      @sols.reject {|sol| sol.date < filter_start_date}
    end
  end

  def filter_date_end
    if @prmf && @prmf["date_end(1i)"] 
      concat_end = @prmf["date_end(1i)"] + "-" + @prmf["date_end(2i)"]  + "-"  + @prmf["date_end(3i)"]
      filter_end_date = Date.parse(concat_end)
      @sols.reject {|sol| sol.date > filter_end_date}
    end    
  end


  def filter_country
    # filter_country = @prmf[:country]    
  end

  def filter_coupon
    if @prmf && @prmf[:coupon] && @prmf[:coupon] != "no coupon"
      @selected_coupon = @prmf[:coupon]
      # filtering sol with coupon_lines
      @sols.reject { |sol| sol.coupon_lines.size == 0 }
      # filtering sol with coupon = user's selected coupon
      @sols.select { |sol| sol.sol_coupons.include?(@selected_coupon) }
    end
  end
end
