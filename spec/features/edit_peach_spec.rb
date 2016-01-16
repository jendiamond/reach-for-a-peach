require 'capybara/rspec'

feature "Edit a Peach"

describe "edit a peach", :type => :feature do
  before :each do
    Peach.create(name: "learn testing", deadline: 5)
  end

  scenario "user sees the edit a peach link" do
    visit "/peaches/#{Peach.last.id}"
    expect(page).to have_css('#edit_peach')
  end

  scenario "takes the user to the edit page when the user clicks the edit button" do
    visit "/peaches/#{Peach.last.id}"
    click_button('Edit Peach')
    expect(current_path).to eq("/peaches/#{Peach.last.id}/edit")
  end

  scenario "updates the peach" do
    visit "/peaches/#{Peach.last.id}/edit"
    within(".edit_peach") do
      fill_in 'Name', with: 'drink less coffee'
      fill_in 'Deadline', with: 1
    end
    click_button('Update Peach')
    expect(current_path).to eq("/peaches/#{Peach.last.id}")
    # visit "/peaches"
    expect(page).to have_content("drink less coffee")
  end
end
