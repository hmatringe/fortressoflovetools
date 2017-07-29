class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show, :destroy]
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
      redirect_to @inventory
    else
      render :index
      flash[:notice] = "Order not created"
    end
  end

  def destroy
    @inventory.destroy
    redirect_to inventories_path
  end

  private
  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

  def inventory_params
    params.require(:inventory).permit(:date)
  end

end
