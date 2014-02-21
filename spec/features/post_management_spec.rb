require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature "page management" do

  context "logged in" do

    before(:each) do
      user = User.new
      user.email = 'test@test.com'
      user.password = user.password_confirmation = 'password'
      user.save
      login_as(user, :scope => :user)
    end

    scenario "create new post" do
      visit new_post_path
      fill_in "Title", :with => "my first post"
      click_button "Publish"

      expect(page).to have_text("Post was successfully published")
    end

    scenario "view draft post list" do
      visit '/me/drafts'
      expect(page).to have_text('Drafts')
    end

    scenario "edit draft post" do
      post = Post.create(title: 'test post')
      visit edit_post_path(post)
      expect(find_field('Your name').value).to have_text('test post')
      expect(page).to have_text('Publish')
    end


  end

  context "not logged in" do

    scenario "view post" do
      post = Post.create(title: "first post")

      visit post_path(post)
      expect(page).to have_text('first post')
    end

  end
end  
