class BlogsController < ApplicationController
  def index
    @blogs = current_user.blogs
  end

  def show
    @blog = current_user.blogs.find(params[:id])
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
      redirect_to blog_path(@blog)
    else
      redirect_to new_blog_path
    end
  end

  def edit
    @blog = current_user.blogs.find(params[:id])    
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update_attributes(title: params[:blog][:title], body: params[:blog][:body])
      redirect_to blog_path(@blog)
    else
      redirect_to edit_blog_path(@blog)
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path
  end

end
