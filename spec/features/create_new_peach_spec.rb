require 'capybara/rspec'

feature "Create a new Peach"

describe "create a new peach", :type => :feature do
  before :each do
    Peach.create(name: "learn testing", deadline: 5)
  end

  it "user sees the create a peach link" do
    visit '/peaches'
    expect(page).to have_css('div#create_peach')
  end

  it "user clicks the create a peach link" do
    visit '/peaches'
    click_link('Create a Peach')
    expect(current_path).to eq('/peaches/new')
  end

  it "fills in the form" do
    visit '/peaches/new'
    within("form#new_peach") do
      fill_in 'Name', :with => 'Get a pet'
      fill_in 'Deadline', :with => 4
    end
    click_button 'Create Peach'
    expect(current_path).to eq("/peaches/#{Peach.last.id}")
  end

  it "displays the new peach on the show page" do
    visit "/peaches/#{Peach.last.id}"
    expect(page).to have_content('learn testing')
    expect(page).to have_content('5 days left')
    expect(page).to have_css('h1#show_title')
  end
end

