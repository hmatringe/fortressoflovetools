class OutOfStockRangesController < ApplicationController
  def index
  	@out_of_stock_ranges = OutOfStockRange.all
  	@out_of_stock_range = OutOfStockRange.new
  end

  def create
  	# @out_of_stock_range = OutOfStockRange.find(params[:id])
	 	@out_of_stock_range = OutOfStockRange.new(out_of_stock_range_params)
  	if @out_of_stock_range.save
  	  redirect_to out_of_stock_ranges_path
  	else
  	  render :index
  	end
  end

  def delete
  end

  private 

  def out_of_stock_range_params
  	params.require(:out_of_stock_range).permit(:date_range, :product_id)
	end
end
