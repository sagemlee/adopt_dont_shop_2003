require 'rails_helper'

RSpec.describe "Pet Creation", type: :feature do
  it "Can add a Pet from pet index page redirected to shelter pet show page" do

    shelter_1 = Shelter.create(name:'Good Shelter', address: '1 wagon rd.', city: 'Denver', state: 'CO', zipcode: '80207')

    shelter_2 = Shelter.create(name:'Pets Pets Pets', address: '32 mountain rd.', city: 'San Diego', state: 'CA', zipcode: '93567')

    pet_1 = Pet.create(image: "https://i.pinimg.com/474x/a3/37/5e/a3375edbf6512fd306b9c9d348947dc8.jpg" ,
                      name:'Walter',
                      approximate_age: 3,
                      sex: "M", shelter_id: shelter_1.id, status: true)

    pet_2 = Pet.create(image: 'https://bluebuffalo.com/globalassets/00-redesign/articles/lifestage-guides/adult-cat-header.jpg' ,
                       name:'Phoebe',
                       approximate_age: 7,
                        sex: "F", shelter_id: shelter_2.id, status: false)

    visit "/shelter/#{shelter_1.id}/pets"
    click_link("Create Pet")
    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/new")

    fill_in :image, with: 'https://bluebuffalo.com/globalassets/00-redesign/articles/lifestage-guides/adult-cat-header.jpg'
    fill_in :image, with: 'Chloe'
    fill_in :image, with: 10
    fill_in :image, with: F
    click_button("Create Pet")

    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")

    have_css("img[src*=pet_3.image]")
    expect(page).to have_content(pet_3.name)
    expect(page).to have_content(pet_3.approximate_age)
    expect(page).to have_content(pet_3.sex)
    expect(page).to have_content("Adoptable")



      end
    end
# As a visitor
# When I visit a Shelter Pets Index page
# Then I see a link to add a new adoptable pet for that shelter "Create Pet"
# When I click the link
# I am taken to '/shelters/:shelter_id/pets/new' where I see a form to add a new adoptable pet
# When I fill in the form with the pet's:
# - image
# - name
# - description
# - approximate age
# - sex ('female' or 'male')
# And I click the button "Create Pet"
# Then a `POST` request is sent to '/shelters/:shelter_id/pets',
# a new pet is created for that shelter,
# that pet has a status of 'adoptable',
# and I am redirected to the Shelter Pets Index page where I can see the new pet listed
