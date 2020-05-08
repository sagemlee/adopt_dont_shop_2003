require 'rails_helper'

RSpec.describe "Shelter Delete", type: :feature do
  it "On shelter show page, click link to delete shelter, return to shelter index, see shelter missing" do
      shelter_1 = Shelter.create(name:'Good Shelter', address: '1 wagon rd.', city: 'Denver', state: 'CO', zipcode: '80207')

      shelter_2 = Shelter.create(name:'Pets Pets Pets', address: '32 mountain rd.', city: 'San Diego', state: 'CA', zipcode: '93567')

      visit "shelters/#{shelter_1.id}"
      click_link("Delete Shelter")
      expect(current_path).to eq("/shelters")

      expect(page).to_not have_content("Good Shelter")
      expect(page).to have_content("Pets Pets Pets")

  end
end
# As a visitor
# When I visit a shelter show page
# Then I see a link to delete the shelter
# When I click the link "Delete Shelter"
# Then a 'DELETE' request is sent to '/shelters/:id',
# the shelter is deleted,
# and I am redirected to the shelter index page where I no longer see this shelter
