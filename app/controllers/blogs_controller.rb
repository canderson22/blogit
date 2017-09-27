class BlogsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    no_access
  end

  def show
    @user = User.find(params[:user_id])
    no_access
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
    @categories = Category.all
  end

  def create
    @blog = Blog.new
    @blog.category = Category.find_by_title(params[:blog][:category])
    @blog.title = params[:blog][:title]
    @blog.body = params[:blog][:body]
    @blog.user = User.find(session[:user_id])
    if @blog.save 
      redirect_to user_blog_path(session[:user_id], @blog)
    else
      redirect_to new_user_blog_path
    end
  end

  def edit
    @blog = current_user.blogs.find(params[:id])    
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update_attributes(title: params[:blog][:title], body: params[:blog][:body])
      redirect_to user_blog_path(@blog)
    else
      redirect_to edit_user_blog_path(@blog)
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to user_blogs_path
  end

end
