class CommentsController < ApplicationController
  def index
    @user = current_user
    no_access
    @comments = @user.comments.all
  end

  def new
    @user = current_user
    @comment = Comment.new
  end

  def create
    @comment = Comment.new
    @comment.user = User.find(session[:user_id])
    @comment.blog = Blog.find(params[:public_blog_id])
    @comment.body = params[:comment][:body]
    if @comment.save
      redirect_to category_public_blog_path(params[:category_id], params[:public_blog_id])
    else
      redirect_to new_category_public_blog_comment(params[:category_id], params[:public_blog_id])
    end
  end

  def edit
    @user = User.find(params[:user_id])
    
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(body: params[:comment][:body])
      redirect_to user_comments_path
    else
      redirect_to edit_user_comment_path(@comment)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:warning] = "Your comment has been deleted."
      redirect_to user_comments_path(params[:user_id])
    else
      redirect_to user_comments_path(params[:user_id])
    end
  end
end
