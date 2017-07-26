class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show]
  def index
    @inventories = Inventory.all
    @inventory = Inventory.new
  end

  def show
    @inventory_primary_line = InventoryPrimaryLine.new
    @inventory_primary_line.inventory = @inventory
  end

  def create
    @inventory = Inventory.new(inventory_params)
    if @inventory.save
      render :show
    else
      render :index
      flash[:notice] = "Order not created"
    end
  end

  private
  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

  def inventory_params
    params.require(:inventory).permit(:id,:date)
  end

end
