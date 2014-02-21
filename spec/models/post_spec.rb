require 'spec_helper'

describe Post do
  describe '#word_count' do
    it "returns number of words" do
      post = Post.new(title: "my first post", body: "just three words")
      expect(post.word_count).to eq 3
    end
  end

  describe '#reading_time' do

  end
end