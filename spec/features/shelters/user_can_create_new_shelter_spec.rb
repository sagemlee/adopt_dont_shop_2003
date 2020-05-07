require 'rails_helper'

RSpec.describe "Shelter Creation", type: :feature do
  it "can click link, see new page shelters/new, fill in form, submit form, see updated list" do
    shelter_1 = Shelter.create(name:'Good Shelter',
                               address: '1 wagon rd.',
                               city: 'Denver',
                               state: 'CO',
                               zipcode: '80207')
    shelter_2 = Shelter.create(name:'Very Good Shelter',
                               address: '32 mountain rd.',
                               city: 'San Diego',
                               state: 'CA',
                               zipcode: '93567')

    visit "/shelters"

    click_link("New Shelter")
    expect(current_path).to eq('/shelters/new')

    fill_in :name, with: "Rescue Pals"
    fill_in :address, with: 'Main st.'
    fill_in :city, with: 'Boston'
    fill_in :state, with: 'MA'
    fill_in :zipcode, with: '12345'
    click_button("Create Shelter")

    expect(current_path).to eq('/shelters')
    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
    expect(page).to have_content('Rescue Pals')
  end
end


# As a visitor
# When I visit the Shelter Index page
# Then I see a link to create a new Shelter, "New Shelter"
# When I click this link
# Then I am taken to '/shelters/new' where I  see a form for a new shelter
# When I fill out the form with a new shelter's:
# - name
# - address
# - city
# - state
# - zip
# And I click the button "Create Shelter" to submit the form
# Then a `POST` request is sent to '/shelters',
# a new shelter is created,
# and I am redirected to the Shelter Index page where I see the new Shelter listed.
