class HomeController < ApplicationController
  before_action :user_new , only: [:index]

  def index
  end

  private
  def user_new
    @user = User.new
  end
end
