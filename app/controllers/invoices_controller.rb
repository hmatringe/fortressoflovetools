class InvoicesController < ApplicationController
  def create
    set_order
    @invoice = Invoice.new(invoice_params)
    @invoice.order = @order
    if @invoice.save
      increment_order_additional_costs
      flash[:notice] = "Invoice added"
    else
      flash[:alert] = "Invoice already exists"
    end
    redirect_to @order
  end

  def destroy
    @invoice = Invoice.find(params[:id])
    @order = Order.find(@invoice.order_id)
    decrement_order_additional_costs
    @invoice.destroy
    redirect_to @order
  end

  private

  def invoice_params
    params.require(:invoice).permit(:id,:amount_in_invoice_currency,:invoice_currency,:amount_in_accounting_currency,:reference,:url,:issue_date,:due_date,:payment_date)
  end

  def set_order
    @order = Order.find(params["order_id"])
  end

  def increment_order_additional_costs
    if @order.additional_costs.nil?
      @order.additional_costs = @invoice.amount_in_accounting_currency
    else
      @order.additional_costs += @invoice.amount_in_accounting_currency
    end
    compute_additional_costs_per_unit
  end

  def decrement_order_additional_costs
    @order.additional_costs -= @invoice.amount_in_accounting_currency
    compute_additional_costs_per_unit
  end

  def compute_additional_costs_per_unit
    @order.additional_costs_per_unit = @order.additional_costs.to_f / @order.qtty
    @order.save
  end
end
