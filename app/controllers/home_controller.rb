class HomeController < ApplicationController
  before_action :user_new , only: [:index]

  def index
    @sub_product = SubProduct.all
  end

  private
  def user_new
    @user = User.new
  end

end
