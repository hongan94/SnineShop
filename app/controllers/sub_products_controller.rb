class SubProductsController < ApplicationController
  layout 'admin'
  def new
    @sub_product = SubProduct.new
    @sub_products = SubProduct.all
  end

  def create
    @sub_product = SubProduct.create(params_sub_product)
    if @sub_product.save
      flash[:notice] ='Sub-Product has create successfully'
      redirect_to new_sub_product_path
    else
      render 'new'
    end
  end

  def index
    @sub_products = SubProduct.all
  end

  private

  def params_sub_product
    params.require(:sub_product).permit(:name, :price, :quantity, :detail, :origin, :status, :discount, :image, :product_id)
  end
end