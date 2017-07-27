class InventoryPrimaryLinesController < ApplicationController
  before_action :set_inventory, only: [:create]
  def create
    @inventory_primary_line = InventoryPrimaryLine.new(inventory_primary_line_params)
    @inventory_primary_line.inventory = @inventory
    validate_product_count_possible
    compute_total_costs_per_unit
    if @inventory_primary_line.save
      flash[:notice] = "Product count added"
    else
      flash[:alert] = "Product already added"
    end
    redirect_to @inventory
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

  def compute_total_costs_per_unit
    array = []
    # get all the order_lines for this product sort by order/arrival_in_stock_date
    sorted = @inventory_primary_line.product.order_lines.sort_by &:arrival_in_stock_date
    sorted.reverse!
    sorted.each do |ol|
      ol.qtty.times {array << ol.total_costs_per_unit.to_f}
    end
    @inventory_primary_line.average_inventory_value_per_unit = array.first(@inventory_primary_line.qtty.to_i).inject{ |sum, el| sum + el }.to_f / @inventory_primary_line.qtty.to_i
  end

  def validate_product_count_possible

  end
end
