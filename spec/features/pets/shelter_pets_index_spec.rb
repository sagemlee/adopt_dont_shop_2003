require 'rails_helper'

RSpec.describe "Shelter Pet Index", type: :feature do
  it "Can see list of pets adoptable at shelter with pet info" do
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

    visit "/shelters/#{shelter_1.id}/pets"
    expect(page).to have_content(shelter_1.name)
    have_css("img[src*=pet_1.image]")
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)

    have_css("img[src*=pet_3.image]")
    expect(page).to have_content(pet_3.name)
    expect(page).to have_content(pet_3.approximate_age)
    expect(page).to have_content(pet_3.sex)

    expect(page).to_not have_content(shelter_2.name)

    expect(page).to have_link("Delete Pet")
    first(:link, 'Delete Pet').click
    expect(current_path).to eq("/pets")

  end
end
