class SubProduct::ProductController < ApplicationController
  before_action :user_new
  def detail
    @sub_product = SubProduct.find(params[:id])
  end

  def show
    @sub_product = SubProduct.find(params[:id])
  end

  def index
   @product = Product.find(params[:id])
   @sub_products = @product.sub_product.all
  end

  private

  def user_new
    @user = User.new
  end

end
