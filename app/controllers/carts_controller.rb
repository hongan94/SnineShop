class CartsController < ApplicationController

  def show
    @cart = Cart.find(params[:id])
    @cart_item = @cart.cart_items
    @user = User.new
  end

  def add
    @sub_product = SubProduct.find(params[:cart_id])
    if params[:quantity].to_i > 1
        quantity = (params[:quantity]).to_i
    else
        quantity = 1
    end
    @cart = Cart.create
    @cart.add(@sub_product,@sub_product.price,quantity)
    redirect_to cart_path(@cart)
  end

  def remove
    @cart.remove_all(@sub_product)
    redirect_to cart_path(@cart)
  end

  private

end


