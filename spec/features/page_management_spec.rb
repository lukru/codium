require 'spec_helper'


feature "page management" do

  scenario "view home page" do
    post = Post.create(title: 'test post')

    visit root_url
    expect(page).to have_text('Codium')
    expect(page).to have_link("Login")
    expect(page).to have_link("Login")

    expect(page).to have_text('test post')
  end

  scenario "view about page" do
    visit about_url
    expect(page).to have_text('About')
  end  

end