class InvoicesController < ApplicationController
  before_action :set_order, only: [:new, :create, :show]
  before_action :set_invoice, only: [:show, :destroy]
  
  def index
    @invoices = Invoice.all
    @paid_invoices ||= @invoices.paid
    @over_due ||= @invoices.unpaid.due_date_passed
    @due_within_30_days ||= @invoices.unpaid.due_within_30_days
    @due_in_more_than_30_days ||= @invoices.unpaid.due_in_more_than_30_days
  end

  def show
  end

  def new
    @invoice = Invoice.new
  end

  def create
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
    @order = Order.find(@invoice.order_id)
    decrement_order_additional_costs
    @invoice.destroy
    redirect_to @order
  end

  private

  def invoice_params
    params.require(:invoice).permit(:id,:amount_in_invoice_currency,:invoice_currency,:amount_in_accounting_currency,:reference,:issue_date,:due_date,:payment_date, :document)
  end

  def set_order
    @order = Order.find(params["order_id"])
  end
  def set_invoice
    @invoice = Invoice.find(params[:id])
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
end
