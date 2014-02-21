class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
  end

  def create
  end

  def list_draft_posts
    @drafts = Post.where(published: false)
  end

  def destroy
    @post = Post.find(params[:id])
    authorize @post
    if @post.destroy
      redirect_to posts_path
    else
      redirect_to posts_path
    end
  end
end
