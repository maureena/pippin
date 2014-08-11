class CategoriesController < ApplicationController
  def index
    @categories = Category.where(parent_id: nil).to_a
  end

  def show
    @category = Category.find(params[:id])
    @subcategories = @category.subcategories.to_a
    @events = @category.events
  end

  def new
    @category = Category.new
    @category.parent = Category.find(params[:id]) unless params[:id].nil?
  end

  def create
    @category = Category.new(category_params)
    @category.parent = Category.find(params[:id]) unless params[:id].nil?
    if @category.save
      flash[:notice] = "Category was saved."
      redirect_to categories_path
    else
      flash[:error] = "There was an error saving the category. Please try again."
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:notice] = "Category was updated"
      render :index
    else
      flash[:error] = "There was an error saving the category. Please try again."
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])

    if @category.destroy
      flash[:notice] = "Category was deleted."
      redirect_to categories_path
    else
      flash[:error] = "There was an error deleting the category. Please try again."
      render :index
    end
  end


  private

  def category_params
    params.require(:category).permit(:name, :id, :parent_id)
  end

end
