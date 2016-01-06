require 'rails_helper'

# RSpec.describe 'peaches', type: :view do
#   it 'Should return a list of peaches/goals' do
#     render :template => "peaches/index.html.erb"
#     rendered.should contain("Peaches")
#     # expect(page).to have_content('Peaches')
#   end
# end

	
feature 'User creates a foobar' do
  scenario 'they see the foobar on the page' do
    visit peaches_path
    expect(page).to have_css 'h1#peach_title', 'Peaches'
  end
end
