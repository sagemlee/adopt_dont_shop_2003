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

    visit "/shelters/#{shelter_1.id}/pets"
    click_link("Create Pet")
    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/new")

    fill_in :image, with: 'https://bluebuffalo.com/globalassets/00-redesign/articles/lifestage-guides/adult-cat-header.jpg'
    fill_in :name, with: 'Chloe'
    fill_in :approximate_age, with: 10
    fill_in :sex, with: "F"
    click_button("Create Pet")

    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")

    expect(page).to have_css("img[src*='https://bluebuffalo.com/globalassets/00-redesign/articles/lifestage-guides/adult-cat-header.jpg']")
    expect(page).to have_content("Chloe")
    expect(page).to have_content(10)
    expect(page).to have_content("F")


      end
    end
