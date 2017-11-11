class PurchaseOrderDraftLinesController < ApplicationController
  before_action :set_purchase_order_draft_line, only: [:edit]

  def edit
    @pod ||= PurchaseOrderDraft.find(@podl.purchase_order_draft_id)
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
    case params[:Update_Type]
    when "Refresh"
      redirect_to edit_purchase_order_draft_line_path(@podl)
    when "Save"
      redirect_to @podl.purchase_order_draft
    end
  end

  private

  def set_purchase_order_draft_line
    @podl = PurchaseOrderDraftLine.find(params[:id])
  end

  def purchase_order_draft_line_params
    params.require(:purchase_order_draft_line).permit(:SKU, :qtty_in_stock, :order_qtty, :qtty_after_order, :sold_in_supply_period_days, :days_of_sales_after_order, :days_out_of_stock, :sales_speed, :days_of_sales_after_order, :status, :comments)
  end
end
