class CartsController < ApplicationController
before_action :prepare_sub_product, only: [:add, :remove]

  def show
    @cart = current_cart
    @user = User.new
  end

  def add
    @cart = Cart.create
    @cart.add(@sub_product,@sub_product.price,@sub_product.quantity)
    redirect_to cart_path
  end

  def remove
    current_cart.remove_all(@sub_product)
    redirect_to cart_path
  end

  private

  def prepare_sub_product
    @sub_product = SubProduct.find(params[:id])
  end
end


