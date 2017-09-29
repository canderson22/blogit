class PublicBlogsController < ApplicationController
  def index
    @user = current_user
    
    @blogs = Blog.all
  end
  
  def show
    @user = current_user
    
    @blog = Blog.find(params[:id])
  end
end
