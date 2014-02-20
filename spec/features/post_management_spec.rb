require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature "page management" do

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
end  
