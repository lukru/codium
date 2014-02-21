class RecommendationsController < ApplicationController

before_action :set_post


def create 
	@recommendation = @post.recommendations.new(recommendation_params)
    @recommendation.user = current_user
    if @recommendation.save
      redirect_to :back
    else
      redirect_to :back,
      :notice => "You have already recommended this"
    end
end

def destroy
	@recommendation.destroy
end

def recommendation_params
	params.require(:recommendation).permit(:kind)
end



def set_post
	@post = Post.find(params[:post_id])
end


end
