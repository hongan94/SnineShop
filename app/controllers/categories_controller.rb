class CategoriesController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
    @categories = Category.all
  end

  def create
    flash[:notice] = "You has create Successfully"
    @category =  Category.new(params_category)
    if @category.save
      redirect_to new_category_path
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
    @categories = Category.all
  end

  def update
    @category = Category.find(params[:id])
    @category.update(params_category)
    if @category.save
      flash[:notice] = 'Categories was successsfully updated !'
      redirect_to new_category_path
    else
      render 'create'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:notice] = "You has Delete Successfully"
    else
      flash[:danger] ="Delete Error"
    end
    redirect_to categories_path
  end

  private

  def params_category
    params.require(:category).permit(:name)
  end

end
