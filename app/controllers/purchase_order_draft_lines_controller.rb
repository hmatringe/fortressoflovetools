class PurchaseOrderDraftLinesController < ApplicationController
  before_action :set_purchase_order_draft_line, only: [:edit]

  def edit
    @pod ||= PurchaseOrderDraft.find(@purchase_order_draft_line.purchase_order_draft_id)
    @product ||= Product.where(SKU: @purchase_order_draft_line.SKU).last
  end

  def update
    @podl = PurchaseOrderDraftLine.find(params[:id])
    @podl.update_attributes purchase_order_draft_line_params
    @podl.qtty_after_order = @podl.order_qtty + @podl.qtty_in_stock
    if @podl.save
      flash[:notice] = "Purchase Order Draft Line Updated"
    else
      flash[:alert] = "Purchase Order Draft Line could not be Updated"
    end
    redirect_to @podl.purchase_order_draft
  end

  private

  def set_purchase_order_draft_line
    @purchase_order_draft_line = PurchaseOrderDraftLine.find(params[:id])
  end

  def purchase_order_draft_line_params
    params.require(:purchase_order_draft_line).permit(:SKU, :qtty_in_stock, :order_qtty, :qtty_after_order, :sold_in_supply_period_days, :days_of_sales_after_order, :days_out_of_stock, :sales_speed, :days_of_sales_after_order, :status, :comments)
  end
end
