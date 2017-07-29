class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy]
  # respond_to :html, :json, :csv
  def index
    @products = Product.all.order(:SKU)
    @product = Product.new
    # respond_with(@products) // JSON works
    respond_to do |format|
      format.html
      # format.csv { render text: @products.to_csv } #to display in browser
      format.csv { send_data @products.to_csv } #to download the csv
      format.xls #{ send_data @products.to_csv(col_sep: "\t") } #to download the csv
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
      redirect_to @product
    else
      render :new
    end
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

  def product_params
    params.require(:product).permit(:SKU)
  end
end
