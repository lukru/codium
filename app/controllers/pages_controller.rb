require 'simple-rss'
require 'open-uri'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, :except => [:index]
  caches_action :blogfeed, :expires_in => 12.hours

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
    @allitems = fetch_feed_items(@urls)
  end


  private #####################################################


  def fetch_feed_items(urls)
    items = []
    urls.each do |url|
      begin
        feed = SimpleRSS.parse open(url)
        channel = feed.channel.title
        feed.items.each do |thing|
          thing[:channel] = channel
          items << thing
        end
      rescue OpenURI::HTTPError => e
        logger.info("Failed to connect to a URL for #{url}")
      end
    end
    #items.sort_by!{ |item| item[:pubDate] }.reverse!
    items
  end

end
