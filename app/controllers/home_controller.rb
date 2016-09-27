class HomeController < ApplicationController
  before_action :user_new , only: [:index]

  def index
    @sub_product = SubProduct.all
  end

  def detail_product
    @sub_product = SubProduct.find(params[:id])
  end

  private
  def user_new
    @user = User.new
  end

end
