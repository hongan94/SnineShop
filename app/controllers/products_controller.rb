class ProductsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @products = Product.all
  end

  def create
    flash[:notice] = "You has create Successfully"
    @product =  Product.new(params_product)
    if @product.save
      redirect_to new_product_path
    else
      render 'new'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      flash[:notice] = "You has Delete Successfully"
    else
      flash[:danger] ="Delete Error"
    end
    redirect_to products_path
  end

  private

  def params_product
    params.require(:product).permit(:name, :category_id)
  end

end
