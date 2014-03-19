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

    context 'load blogfeed page' do
      it 'load the page' do
        response.should be_success
      end
      it 'should still get page if user is logged in or out' do
        true.should == false
      end
      it 'return a nice error if every url attached fails' do
        true.should == false
      end
    end #loading blogfeed page

    context 'loading posts' do
      it 'all have valid urls' do
        true.should == false
      end
      it 'connect to at least one url' do
        true.should == false
      end
      it 'return at least one post' do
        true.should == false
      end
    end #loading posts
  end #blogfeed
end