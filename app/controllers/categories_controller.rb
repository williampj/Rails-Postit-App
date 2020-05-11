class CategoriesController < ApplicationController
  before_action :require_user, only: [:new, :create]
  
  def new
    @category = Category.new 
  end

  def create
    @category = Category.new(params.require(:category).permit(:name))

    if @category.save 
      flash[:notice] = "#{@category.name} has been added as a category"
      redirect_to root_path 
    else 
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end
end