require 'rails_helper'

RSpec.describe "Pet Update", type: :feature do
  it "Can update pet info from pet show page, can see updates in pet show page" do
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

    visit "/pets/#{pet_1.id}"
    click_link("Update Pet")

    expect(current_path).to eq("/pets/#{pet_1.id}/edit")
    fill_in :image, with: 'https://bluebuffalo.com/globalassets/00-redesign/articles/lifestage-guides/adult-cat-header.jpg'
    fill_in :name, with: 'Chloe'
    fill_in :approximate_age, with: 10
    fill_in :sex, with: "F"
    click_button("Update Pet")

    expect(current_path).to eq("/pets/#{pet_1.id}")

    expect(page).to have_css("img[src*='https://bluebuffalo.com/globalassets/00-redesign/articles/lifestage-guides/adult-cat-header.jpg']")
    expect(page).to have_content("Chloe")
    expect(page).to have_content(10)
    expect(page).to have_content("F")

    expect(page).to_not have_content("Walter")
    expect(page).to_not have_content(3)


  end
end
# As a visitor
# When I visit a Pet Show page
# Then I see a link to update that Pet "Update Pet"
# When I click the link
# I am taken to '/pets/:id/edit' where I see a form to edit the pet's data including:
# - image
# - name
# - description
# - approximate age
# - sex
# When I click the button to submit the form "Update Pet"
# Then a `PATCH` request is sent to '/pets/:id',
# the pet's data is updated,
# and I am redirected to the Pet Show page where I see the Pet's updated information
