require 'rails_helper'

RSpec.describe "shelters id page", type: :feature do
  it "can see name, address, city, state, zipcode of shelter with given id" do
    shelter_1 = Shelter.create(name:'Good Shelter', address: '1 wagon rd.', city: 'Denver', state: 'CO', zipcode: '80207')

    shelter_2 = Shelter.create(name:'Very Good Shelter', address: '32 mountain rd.', city: 'San Diego', state: 'CA', zipcode: '93567')

    visit "/shelters/#{shelter_1.id}"
    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_1.zipcode)
  end
end
