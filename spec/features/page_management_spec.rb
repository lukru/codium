require 'spec_helper'


feature "page management" do

  scenario "view home page" do
    visit root_url
    expect(page).to have_text('Codium')
  end

  scenario "view about page" do
    visit about_url
    expect(page).to have_text('About')
  end
end