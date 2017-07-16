class OrderLinesController < ApplicationController
  def create
    set_order
    @order_line = OrderLine.new(order_line_params)
    @order_line.order = @order
    if @order_line.save
      increment_order_qtty
      flash[:notice] = "Product saved"
    else
      flash[:alert] = "Product already exists"
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

  def order_line_params
    params.require(:order_line).permit(:id,:qtty,:product_id,:order_id)
  end

  def increment_order_qtty
    @order.qtty = @order.qtty.to_i + @order_line.qtty
    @order.save
  end

  def decrement_order_qtty
    @order.qtty = @order.qtty.to_i - @order_line.qtty
    @order.save
  end

  def set_order
    @order = Order.find(params["order_id"])
  end
end
