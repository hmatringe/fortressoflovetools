class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show]
  def index
    @inventories = Inventory.all
  end

  def show

  end

  def new
  end

  def create
  end

  private
  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

  def inventory_params
    params.require(:order).permit(:id,:name)
  end

end
