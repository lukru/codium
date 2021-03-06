require 'spec_helper'


feature "page management" do

  scenario "view home page" do
    post = Post.create(title: 'test post')

    visit root_url
    expect(page).to have_text('Codium')
    expect(page).to have_link("Login")
    expect(page).to have_text('test post')
  end

  scenario "view about page" do
    visit about_url
    expect(page).to have_text('About')
  end  

  scenario "view team page" do
    user = User.new(email: 'test@test.com')
    user.username = 'epoch'
    user.password = user.password_confirmation = 'password'
    user.uid = '12345'
    user.provider = 'github'
    user.save

    visit '/team'

    expect(page).to have_text('Meet our team')
    expect(page).to have_link("epoch", :href=>"/users/epoch")
    expect(page).to have_css('img')
  end

end