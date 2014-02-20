require 'spec_helper'

describe Post do
  describe '#word_count' do
    it "returns number" do
      post = Post.new(title: "my first post")
      expect(post.word_count).to eq 3
    end
  end
end