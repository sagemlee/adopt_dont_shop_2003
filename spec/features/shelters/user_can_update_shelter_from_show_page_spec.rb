require 'rails_helper'

RSpec.describe "Shelter Update", type: :feature do
  it "Can click update link on show page, see shelter/:id/edit, make changes, and see those changes on show page" do
    shelter_1 = Shelter.create(name:'Good Shelter', address: '1 wagon rd.', city: 'Denver', state: 'CO', zipcode: '80207')

    shelter_2 = Shelter.create(name:'Very Good Shelter', address: '32 mountain rd.', city: 'San Diego', state: 'CA', zipcode: '93567')

    visit "shelters/#{shelter_1.id}"
    click_link("Update Shelter")
    expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")

    fill_in :name, with: "Shelter Shack"
    fill_in :address, with: 'Broadway'
    fill_in :city, with: 'Austin'
    fill_in :state, with: 'TX'
    fill_in :zipcode, with: '12346'
    click_button("Submit Shelter Updates")

    expect(current_path).to eq("/shelters/#{shelter_1.id}")
    expect(page).to have_content("Shelter Shack")
    expect(page).to have_content('Broadway')
    expect(page).to have_content('Austin')
    expect(page).to have_content('TX')
    expect(page).to have_content('12346')

  end
end
