class InventoryPrimaryLinesController < ApplicationController
  before_action :set_inventory, only: [:create, :import]
  def index
    @inventory = Inventory.find(params["inventory_id"])
    respond_to do |format|
      format.html
      format.csv { send_data @inventory.inventory_primary_lines.to_csv } #to download the csv
      format.xls #{ send_data @inventory.inventory_primary_lines.to_csv(col_sep: "\t") } #to download the csv
    end
  end

  def import
    InventoryPrimaryLine.import(params[:file],@inventory.id)
    redirect_to inventory_path(@inventory), notice: "Products imported."
  end

  def create
    @inventory_primary_line = InventoryPrimaryLine.new(inventory_primary_line_params)
    @inventory_primary_line.inventory = @inventory

    if validate_product_count_possible
      compute_total_costs_per_unit
      if @inventory_primary_line.save
        flash[:notice] = "Product count added"
      else
        flash[:alert] = "Product already added"
      end
      redirect_to @inventory
    else
      flash[:alert] = "This product was never ordered in such quantity (total ever: #{@qtty_ever_ordered || 0})"
      redirect_to @inventory
    end
  end

  def destroy
    @inventory_primary_line = InventoryPrimaryLine.find(params[:id])
    @inventory = Inventory.find(@inventory_primary_line.inventory_id)
    @inventory_primary_line.destroy
    redirect_to @inventory
  end

  private
  def set_inventory
    @inventory = Inventory.find(params["inventory_id"])
  end

  def inventory_primary_line_params
    params.require(:inventory_primary_line).permit(:id,:qtty,:product_id,:inventory_id)
  end

  def validate_product_count_possible
    input_stock_qtty = @inventory_primary_line.qtty.to_i
    if @inventory_primary_line.product.order_lines.present?
      @qtty_ever_ordered = @inventory_primary_line.product.order_lines.pluck(:qtty).reduce(:+)
      input_stock_qtty <= @qtty_ever_ordered
    else
      false
    end
  end

  def compute_total_costs_per_unit
    array = []
    # get all the order_lines for this product sort by order/arrival_in_stock_date
    sorted = @inventory_primary_line.product.order_lines.sort_by &:arrival_in_stock_date
    sorted.reverse!
    sorted.each do |ol|
      ol.qtty.times {array << ol.total_costs_per_unit.to_f}
    end
    qtty = @inventory_primary_line.qtty.to_i
    @inventory_primary_line.average_inventory_value_per_unit = array.first(qtty).inject{ |sum, el| sum + el }.to_f / qtty
  end

end
