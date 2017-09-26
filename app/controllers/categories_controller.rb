class CategoriesController < ApplicationController
  def show
    @user = User.find(session[:user_id])
    @category = Category.find(params[:id])
    @blogs = Blog.find_by_category_id(@category.id)
  end
end
