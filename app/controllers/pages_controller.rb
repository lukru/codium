require 'simple-rss'
require 'open-uri'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, :except => [:index]

  def home
    @posts = Post.all.limit(4)
  end

  def about
  end

  def team
    @users = User.all
  end

  def blogfeed

    @urls = User.pluck(:rss).compact
    @allitems = []
    @urls.each do |url|
      begin
        feed = SimpleRSS.parse open(url)
          @channel = feed.channel.title
          feed.items.each do |thing|
            thing[:channel] = @channel
            @allitems << thing
          end

      rescue OpenURI::HTTPError => e
        logger.info("Failed to connect to a URL for #{url}")
      end
    end
    @allitems.sort_by!{ |item| item[:pubDate]}.reverse!
  end

end
