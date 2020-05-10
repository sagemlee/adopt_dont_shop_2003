require 'rails_helper'

RSpec.describe "Pet Delete", type: :feature do
  it "Can click delete button from pet show page and see it missing from the index page" do
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
    pet_3 = Pet.create(image: 'https://bluebuffalo.com/globalassets/00-redesign/articles/lifestage-guides/adult-cat-header.jpg' ,
                       name:'Chloe',
                       approximate_age: 10,
                        sex: "F", shelter_id: shelter_1.id, status: false)

    visit "/pets/#{pet_2.id}"
    expect(page).to have_link("Delete Pet")
    click_link("Delete Pet")
    expect(current_path).to eq("/pets")

    have_css("img[src*=pet_1.image]")
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)

    have_css("img[src*=pet_3.image]")
    expect(page).to have_content(pet_3.name)
    expect(page).to have_content(pet_3.approximate_age)
    expect(page).to have_content(pet_3.sex)

    expect(page).to_not have_content(shelter_2.name)
  end
end

# As a visitor
# When I visit a pet show page
# Then I see a link to delete the pet "Delete Pet"
# When I click the link
# Then a 'DELETE' request is sent to '/pets/:id',
# the pet is deleted,
# and I am redirected to the pet index page where I no longer see this pet
