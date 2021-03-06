class BrandsController < ApplicationController
  before_action :set_brand, only: [:show, :edit, :update, :destroy]

  # GET /brands
  def index
    @brands = Brand.all
  end

  # GET /brands/1
  def show
  end

  # GET /brands/new
  def new
    @brand = Brand.new
  end

  # GET /brands/1/edit
  def edit
  end

  # POST /brands
  def create
    @brand = Brand.new(brand_params)

    if @brand.save
      flash[:notice] = 'Brand was successfully created.'
      redirect_to @brand
    else
      errors = @brand.errors.any? ? @brand.errors.full_messages : 'Something went wrong.'
      flash[:error] = errors
      render :new
    end
  end

  # PATCH/PUT /brands/1
  def update
    if @brand.update(brand_params)
      redirect_to @brand, notice: 'Brand was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /brands/1
  def destroy
    @brand.destroy
    redirect_to brands_url, notice: 'Brand was successfully destroyed.'
  end

  private
    def set_brand
      @brand = Brand.find(params[:id])
    end

    def brand_params
      params.require(:brand).permit(:name)
    end
end
