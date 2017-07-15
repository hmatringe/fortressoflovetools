class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit]
  def index
    @orders = Order.all
    @order = Order.new
  end

  def show
    @order_line = OrderLine.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to @order
      # render :index
      flash[:notice] = "Order successfully created"
    else
      render :index
      flash[:notice] = "Order not created"
    end
  end

  def edit
  end

  def update
  end

  private
  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:name, :qtty)
  end
end
