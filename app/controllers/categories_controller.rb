class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @user = current_user
    @category = Category.find(params[:id])
    @blogs = @category.blogs
  end
end
