class ParentProductsController < ApplicationController
  before_action :set_parent_product, only: [:edit]  

  def index
    @parent_products = ParentProduct.all.order(:sku)
  end

  def new
    @parent_product = ParentProduct.new
  end

  def create
    @parent_product = ParentProduct.new(parent_product_params)
    if @parent_product.save
      redirect_to parent_products_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @parent_product = ParentProduct.find(params[:id])
    @parent_product.update(parent_product_params)
    @parent_product.save ? redirect_to(parent_products_path) : (render :edit)
  end

  private

  def set_parent_product
    @parent_product = ParentProduct.find(params[:id])
  end

  def parent_product_params
    params.require(:parent_product).permit(:sku,
                                    :usual_production_price,
                                    :usual_production_currency,
                                    :photo)
  end
end
