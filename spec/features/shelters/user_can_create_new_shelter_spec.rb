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
    expect(page).to have_link("New Shelter")

    # click_link("New Shelter")
    # expect(page).to have_xpath('/shelters/new')
    # expect(page).to have_field('Name')
    # expect(page).to have_field('Address')
    # expect(page).to have_field('City')
    # expect(page).to have_field('State')
    # expect(page).to have_field('Zipcode')
    # expect(page).to have_button('Create Shelter')
    #
    # fill_in 'First Name', with: 'Rescue Pals'
    # fill_in 'Address', with: 'Main st.'
    # fill_in 'City', with: 'Boston'
    # fill_in 'State', with: 'MA'
    # fill_in 'Zipcode', with: '12345'
    # click_button("Create Shelter")
    #
    # expect(page).to have_xpath('/shelters')
    # expect(page).to have_content(shelter_1.name)
    # expect(page).to have_content(shelter_2.name)
    # expect(page).to have_content('Rescue Pals')
    #
    #

  end
end
