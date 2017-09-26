class CategoriesController < ApplicationController

  def show
    @user = current_user
    @category = Category.find(params[:id])
    @blogs = @category.blogs
  end
end
