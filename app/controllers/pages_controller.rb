class PagesController < ApplicationController
    skip_before_action :authenticate_user!, :except => [:index]

  def home
    @posts = Post.all.limit(4)
  end
  def about
  end
end
