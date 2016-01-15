require 'rails_helper'

feature 'User visits the index page' do
  scenario 'they see the list of peaches on the page' do
    visit peaches_path
    expect(page).to have_css('h1#peach_title')
  end

  scenario 'they see the footer' do
    visit peaches_path
    expect(page).to have_content('LA Hobby Dev Shop')
  end
end