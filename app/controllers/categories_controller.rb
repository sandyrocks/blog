class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save 
      respond_to do |format|
        format.html { redirect_to categories_path, info: 'Category created successfully.'}
      end 
    else
      render 'new'
    end
  end 

  def edit
  end

  def update
    if @category.update(category_params)
      respond_to do |format|
        format.html { redirect_to categories_path, notice: 'Category updated succesfully.'}
      end 
    else
      render 'edit'
    end 
  end 

  private
    def set_category
      @category = Category.find(params[:id])
    end 

    def category_params
      params.require(:category).permit(:name)
    end  
end
