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
    before :each do
      allow(User).to receive(:select).with(:rss).and_return( double(all: urls))
    end
    let(:feed) { double(channel: double(title: 'cheese'), items: []) }
    let(:rss) { double }
    let(:urls) { ['http://sampeters.net/blog/feed/', 'http://rubyglasses.blogspot.com/feeds/posts/default?alt=rss'] }

    it 'should call open on something' do
      allow(SimpleRSS).to receive(:parse).with(any_args).and_return(feed)
      urls.each do |url|
        expect_any_instance_of(PagesController).to receive(:open).with(url)
      end
      get :blogfeed
    end

    it "shouldn't explode if one feed isn't there" do

      urls = ['fjsdkfjdskfsdsdklf', 'LOL']
      allow(SimpleRSS).to receive(:parse).with(any_args).and_return(feed)
      expect{get :blogfeed}.not_to raise_error
    end

    context "stubbed out open" do
      before(:each) do
        allow_any_instance_of(PagesController).to receive(:open).with(any_args)
      end

      it 'should call parse' do

        expect(SimpleRSS).to receive(:parse).with(any_args).exactly(urls.length).times.and_return(feed)
        get :blogfeed
      end

      context 'assuming the parser works' do
        before :each do
          allow(SimpleRSS).to receive(:parse).with(any_args).and_return(feed)
          get :blogfeed
        end
        it 'all have valid urls' do
          expect(assigns(:urls)).to eq(urls)
        end
        it 'connect to at least one url' do
          pending 'I ainnt done yet'
          expect(true).to be_false
        end
        it 'return at least one post'


        context 'load blogfeed page' do
          it 'load the page' do
            response.should be_success
          end

        end #loading blogfeed page

      end #assume parser works
    end # stubbed out open


  end #blogfeed
end