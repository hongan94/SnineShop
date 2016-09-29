class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_cart
    @item = SubProduct.find(params[:id])
    if session[:cart_id] then
     cart = session[:cart]
    else
      session[:cart] = {}
      cart = session[:cart]
    end
    if cart[id] && cart[id] < @item.quantity then
      cart[id] = cart[id] +1
    else
      cart[id] = 1
    end
  end
end