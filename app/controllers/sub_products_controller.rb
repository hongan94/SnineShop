class SubProductsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'
  def new
    @sub_product = SubProduct.new
    @sub_products = SubProduct.all
  end

  def show
    @sub_products = SubProduct.all
  end

  def edit
    @sub_product = SubProduct.find(params[:id])
    @sub_products = SubProduct.all
  end

  def update
    @sub_product = SubProduct.find(params[:id])
    @sub_product.update(params_sub_product)
    if @sub_product.save
      flash[:notice] = 'Sub-Product was successsfully updated !'
      redirect_to new_admin_sub_product_path
    else
      render 'create'
    end
  end

  def show
    @sub_product = SubProduct.find(params[:id])
  end

  def create
    @sub_product = SubProduct.create(params_sub_product)
    if @sub_product.save
      flash[:notice] ='Sub-Product has create successfully'
      redirect_to new_admin_sub_product_path
    else
      render 'new'
    end
  end

  def index
    @sub_products = SubProduct.all
  end

  def destroy
    @sub_product = SubProduct.find(params[:id])
    if @sub_product.destroy
      flash[:notice] = "You has Delete Successfully"
    else
      flash[:danger] ="Delete Error"
    end
    redirect_to admin_sub_products_path
  end

  private

  def params_sub_product
    params.require(:sub_product).permit(:name, :price, :quantity, :detail, :origin, :status, :discount, :image, :product_id)
  end
end