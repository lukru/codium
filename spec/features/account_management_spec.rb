require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature "account management" do

  before(:each) do
    user = User.new
    user.email = 'test@test.com'
    user.password = user.password_confirmation = 'password'
    user.save
    login_as(user, :scope => :user)
  end

  scenario "user sign out" do
    visit destroy_user_session_path

    response.should redirect_to(root_url)
  end

  scenario "view profile page" do
    visit '/me/profile'
    expect(page).to have_text(user.email)
  end

  scenario "view draft post list" do
    visit '/me/drafts'
    expect(page).to have_text('Drafts')
  end


end  
