class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :destroy]
  before_action :set_product_sales_order_lines, only: [:show]
  # respond_to :html, :json, :csv
  def index
    @products = Product.all.order(:SKU)
    @product = Product.new
    respond_to do |format|
      format.html
      format.csv { send_data @products.to_csv }
      format.xls
    end
  end

  def import
    Product.import(params[:file])
    redirect_to products_path, notice: "Products imported."
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
      @product = Product.new(product_params)
    if @product.save
      # redirect_to @product
      redirect_to products_path
    else
      render :new
      # raise
    end
  end

  def edit

  end
  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    @product.save ? redirect_to(product_path(@product)) : (render :edit)
  end
  def destroy
    @product.destroy
    redirect_to products_path
    flash[:notice] = "Product successfully deleted"
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def set_product_sales_order_lines
    @product_sols = SalesOrderLine.where(product: @product).order("date desc")
  end

  def product_params
    params.require(:product).permit(:SKU,
                                    :name,
                                    :parentSKU,
                                    :size,
                                    :color,
                                    :structure,
                                    :category,
                                    :supplier_id,
                                    :heel_thickness,
                                    :platform,
                                    :material,
                                    :heel_height,
                                    :closing_type,
                                    :EAN,
                                    :woocommerce_product_id,
                                    :platform)
  end
end