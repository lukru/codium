class CommentsController < ApplicationController

	before_action :set_post

	def index
    @comments = @post.comments.all
  	end

  	def new
    @comment = @post.comments.new
  	end


  	def create
    @comment = @post.comments.new(comment_params)
    # @comment = current_user.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comment }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    redirect_to @post
  end
  

  	def set_post
      if params[:post_id]
        @post = Post.find(params[:post_id])
      else
        @post = @comment.post if @comment.present?
      end
    end 

	def comment_params
    params.require(:comment).permit(:title, :content, :image, :user_id)
    end

end
