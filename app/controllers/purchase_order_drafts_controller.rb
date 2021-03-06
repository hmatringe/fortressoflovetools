class PurchaseOrderDraftsController < ApplicationController
  before_action :set_purchase_order_draft_and_podl, only: [:show, :edit, :beautiful]
  def index
    @purchase_order_drafts = PurchaseOrderDraft.all
  end

  def show
  end

  def beautiful
  end

  def new
    @purchase_order_draft = PurchaseOrderDraft.new
  end

  def create
    @purchase_order_draft = PurchaseOrderDraft.new(purchase_order_draft_params)
    @purchase_order_draft.inventory = Inventory.find(params[:purchase_order_draft][:inventory_id].to_s)
    if @purchase_order_draft.save
      products = Product.all.reject { |p| p.supplier != @purchase_order_draft.supplier}
      products.each do |p|
        # getting qtty from selected inventory
        qtty_in_stock = if @purchase_order_draft.inventory.inventory_primary_lines.where(product_id:p.id).pluck(:qtty)[0].to_i
            @purchase_order_draft.inventory.inventory_primary_lines.where(product_id:p.id).pluck(:qtty)[0].to_i
        else
          0
        end
        # filter by product
        sols = SalesOrderLine.where(product: p)
        # filter by date
        period_start = Date.today - @purchase_order_draft.supply_period_days.to_i
        sols = sols.reject {|sol| sol.date < period_start}
        qtty_sold = sols.pluck(:qtty).reduce(:+)
        days_out_of_stock = p.days_out_of_stock_since(period_start)
        podl = PurchaseOrderDraftLine.new(
        qtty_in_stock:              qtty_in_stock,
        order_qtty:                 0,
        qtty_after_order:           qtty_in_stock,
        days_out_of_stock:          days_out_of_stock,
        sold_in_supply_period_days: qtty_sold.to_i,
        )
        podl.product = p
        podl.purchase_order_draft = @purchase_order_draft
        podl.save
      end
      flash[:notice] = "Purchase Order Draft Created"
    else
      flash[:alert] = "Purchase Order Draft could not be created"
    end
    redirect_to @purchase_order_draft
  end

  private

  def set_purchase_order_draft_and_podl
    @purchase_order_draft = PurchaseOrderDraft.find(params[:id])
    @podl = @purchase_order_draft.purchase_order_draft_lines
  end

  def purchase_order_draft_params
    params.require(:purchase_order_draft).permit(:name, :supply_period_days, :qtty, :supplier, :inventory_id, :supplier_id, :product_id)
  end
end
