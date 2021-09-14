class ProductsController < ApplicationController
  before_action :set_product, only: [:new, :edit, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    @product.update(preduct_params)
    redirect_to products_path
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.requite(:product).permit(:name, :price)
  end

end
