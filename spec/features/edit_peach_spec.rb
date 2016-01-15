#Given the user is on peaches/id DONE
#when the user clicks the button edit DONE
#than you are redirected to the edit form DONE

#given the user is on the peaches/id/edit page DONE
#when we are on the edit page DONE
#then the user will see the name field DONE
#and the user will see the deadline field DONE

# when the user fills in the name field with drink less coffee DONE
# and the user fills in the deadline with 1 DONE
# and the user clicks on the update button DONE
# then user is redirected to the index page DONE

# when the user is on peaches/index
# then the user will see the updated peach

require 'capybara/rspec'

feature "Edit a Peach"

describe "edit a peach", :type => :feature do
  before :each do
    Peach.create(name: "learn testing", deadline: 5)
  end

  it "user sees the edit a peach link" do
    visit "/peaches/#{Peach.last.id}"
    expect(page).to have_css('#edit_peach')
  end

  it "takes the user to the edit page when the user clicks the edit button" do
    visit "/peaches/#{Peach.last.id}"
    click_button('Edit Peach')
    expect(current_path).to eq("/peaches/#{Peach.last.id}/edit")
  end

  it "updates the peach" do
    visit "/peaches/#{Peach.last.id}/edit"
    within(".edit_peach") do
      fill_in 'Name', with: 'drink less coffee'
      fill_in 'Deadline', with: 1
    end
    click_button('Update Peach')
    expect(current_path).to eq("/peaches")
    # visit "/peaches"
    expect(page).to have_content("drink less coffee")
  end
end
