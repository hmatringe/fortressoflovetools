class OrderLinesController < ApplicationController
  before_action :set_order, only: [:create]
  def create
    @order_line = OrderLine.new(order_line_params)
    @order_line.order = @order
    if @order_line.save
      increment_order_qtty
      flash[:notice] = "Product added"
    else
      flash[:alert] = "Product already added"
    end
    redirect_to @order
  end

  def destroy
    @order_line = OrderLine.find(params[:id])
    @order = Order.find(@order_line.order_id)
    decrement_order_qtty
    @order_line.destroy
    redirect_to @order
  end

  private

  def set_order
    @order = Order.find(params["order_id"])
  end

  def order_line_params
    params.require(:order_line).permit(:id,:qtty,:product_id,:order_id,:production_cost_per_unit_invoice_currency,:production_cost_per_unit_accounting_currency)
  end

  def increment_order_qtty
    @order.qtty = @order.qtty.to_i + @order_line.qtty
    compute_additional_costs_per_unit
  end

  def decrement_order_qtty
    @order.qtty = @order.qtty.to_i - @order_line.qtty
    compute_additional_costs_per_unit
  end

end
