require 'spec_helper'

describe PagesController do

  context 'home' do
    it 'load the page' do
      response.should be_success
    end
  end

  context 'team' do
    it 'load the page' do
      response.should be_success
    end
  end

  context 'blogfeed' do
    let(:urls) { ['http://sampeters.net/blog/feed/', 'http://rubyglasses.blogspot.com/feeds/posts/default?alt=rss'] }
    let(:feed) { double(channel: double(title: 'cheese'), items: [{title: "fish", content: "fish blog post"},{title: "banana", content: "banana blog post"},{title: "cheese", content: "cheese blog post"}]) }
    it "should set up urls" do
      expect(urls.first).to eq("http://sampeters.net/blog/feed/")
    end

    it "should set up all items from a feed" do
    allitems = feed.items
    expect(allitems.length).to eq(3)
    end

    it "should call 'fetch_feed_items' on the urls" do
      receive(:fetch_feed_items).with(urls)
    end

  end


  context "fetch_feed_items" do
    before :each do
      allow(User).to receive(:select).with(:rss).and_return( double(all: urls))
      class PagesController
        public :fetch_feed_items
      end
    end
    let(:feed) { double(channel: double(title: 'cheese'), items: []) }
    let(:feed_w_items) { double(channel: double(title: 'cheese'), items: [{'a' => 'b'}]) }
    let(:rss) { double }
    let(:urls) { ['http://sampeters.net/blog/feed/', 'http://rubyglasses.blogspot.com/feeds/posts/default?alt=rss'] }

    it "should call open on something" do
      allow(SimpleRSS).to receive(:parse).with(any_args).and_return(feed)
      urls.each do |url|
        expect_any_instance_of(PagesController).to receive(:open).with(url)
      end
      @controller.fetch_feed_items(urls)
    end

    it "shouldn't explode if one feed isn't there" do
      dumb_urls = ['http://fjsdkfjdskfsdsdklf', 'http://LOL']
      allow(SimpleRSS).to receive(:parse).with(any_args).and_return(feed)
      expect{@controller.fetch_feed_items(dumb_urls)}.not_to raise_error
    end

    context "stubbed out open" do
      before(:each) do
        allow_any_instance_of(PagesController).to receive(:open).with(any_args)
      end

      it "should call parse" do
        expect(SimpleRSS).to receive(:parse).with(any_args).exactly(urls.length).times.and_return(feed)
        @controller.fetch_feed_items(urls)
      end

      context "assuming the parser works" do
        before :each do
          allow(SimpleRSS).to receive(:parse).with(any_args).and_return(feed_w_items)
          @controller.fetch_feed_items(urls)
        end

        it "should load at least one item" do
        itemresults = @controller.fetch_feed_items(urls)
        expect(itemresults.count).to_not be_nil
        end

        it "should give me something useful inside a result" do
        itemresults = @controller.fetch_feed_items(urls)
        expect(itemresults.first.keys).to include(:channel)
        end

        context 'load blogfeed page' do
          it 'load the page' do
            response.should be_success
          end

        end #loading blogfeed page

      end #assume parser works
    end # stubbed out open


  end #blogfeed
end