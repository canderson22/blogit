class CategoriesController < ApplicationController
  def show
    @user = current_user
    @category = Category.find(params[:id])
    @blogs = Blog.find_by_category_id(@category.id)
  end
end
