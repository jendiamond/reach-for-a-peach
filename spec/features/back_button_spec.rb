require 'capybara/rspec'

feature "back button"

describe "back button for show", :type => :feature do
	before :each do
    Peach.create(name: "learn testing", deadline: 5)
  end

  scenario "user sees the back button" do
    visit "/peaches/#{Peach.last.id}"
    click_link("Back")
    expect(current_path).to eq(peaches_path)
  end
end