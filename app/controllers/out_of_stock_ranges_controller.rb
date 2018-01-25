class OutOfStockRangesController < ApplicationController
  before_action :set_out_of_stock_range, only: [:destroy]

  def index
  	@out_of_stock_ranges = OutOfStockRange.order(date_range: :desc)
  	@out_of_stock_range = OutOfStockRange.new
  end

  def create
	 	@out_of_stock_range = OutOfStockRange.new(out_of_stock_range_params)
  	if @out_of_stock_range.save
  	  redirect_to out_of_stock_ranges_path
  	else
  	  render :index
  	end
  end

  def destroy
    @out_of_stock_range.destroy
    redirect_to out_of_stock_ranges_path
    flash[:notice] = "Out of Stock Range successfully deleted"
  end


  private 

  def set_out_of_stock_range
    @out_of_stock_range = OutOfStockRange.find(params[:id])
  end

  def out_of_stock_range_params
  	params.require(:out_of_stock_range).permit(:date_range, :product_id)
	end
end
