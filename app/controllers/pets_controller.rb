class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def create
    shelter = Shelter.find(params[:shelter_id])
    pet = shelter.pets.create!(pet_params)
  end
end
