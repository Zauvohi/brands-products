class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  def index
    @products = Product.all
  end

  # GET /products/1
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = 'Product was successfully created.'
      redirect_to @product
    else
      flash[:error] = get_error_messages_from(@product)
      render :new
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      flash[:notice] = 'Product was successfully updated.'
      redirect_to @product
    else
      flash[:error] = get_error_messages_from(@product)
      render :edit
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :brand_id, :description, :price)
    end
end
