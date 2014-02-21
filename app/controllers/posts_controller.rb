class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.new
  end

  def create
    params[:commit] == 'Publish' ? published = true : published = false
    params[:post][:published] = published
    @post = current_user.posts.new(post_params)
    
    respond_to do |format|
      if @post.save
        @post.published == true ? notice = 'published' : notice = 'saved as draft'
        format.html { redirect_to new_post_path, notice: 'Post was successfully ' + notice}
      else
        format.html { render action: 'new', notice: 'Error: cannot able to save the new post'}
      end
    end
  end

  def draft_posts
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

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :subtitle, :body, :published)
  end

end
