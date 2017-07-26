class InventoryPrimaryLinesController < ApplicationController
  before_action :set_inventory, only: [:create]
  def create
    @inventory_primary_line = InventoryPrimaryLine.new(inventory_primary_line_params)
    @inventory_primary_line.inventory = @inventory
    if @inventory_primary_line.save
      flash[:notice] = "Product count added"
    else
      flash[:alert] = "Product count already added"
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
end
