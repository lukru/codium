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

      #it 'Load if youre logged in' do
      #  sign_in nil
      #  get :blogfeed
      #  response.should be_success
      #end
      #it 'load if youre a guest' do
      #  sign_in
      #  get :blogfeed
      #  response.should be_success
      #end

    end #loading blogfeed page

    context 'loading posts' do
      it 'all have valid urls' do
        assigns(:url).should_not be_nil
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