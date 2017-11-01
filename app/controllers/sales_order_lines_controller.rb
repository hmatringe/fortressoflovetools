class SalesOrderLinesController < ApplicationController
  
  def index
    @sales_order_lines ||= SalesOrderLine.all.order("created_at DESC")
  end

  def import
    SalesOrderLine.import(params[:file])
    redirect_to sales_order_lines_path, notice: "Sales Order Lines imported."
  end
end
