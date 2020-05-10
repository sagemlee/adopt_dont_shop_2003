require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see all shelter names and links to edit each shelter" do
    shelter_1 = Shelter.create(name:'Pets Pets Pets')

    shelter_2 = Shelter.create(name:'Very Good Shelter')

    visit "/shelters"

    expect(page).to have_link("Pets Pets Pets")
    expect(page).to have_link("Very Good Shelter")
    
    expect(page).to have_link("Update Shelter")

    first(:link, 'Update Shelter').click
    expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")

    visit "/shelters"
    expect(page).to have_content(shelter_1.name)
    first(:link, 'Delete Shelter').click
    expect(current_path).to eq("/shelters")

    expect(page).to_not have_content(shelter_1.name)

  end
end
