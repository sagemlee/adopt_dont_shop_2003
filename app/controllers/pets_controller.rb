class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end


  def index_specific
    @pets = Pet.all
    @current_shelter = Shelter.find(params[:shelter_id])
    @current_shelter_id = params[:shelter_id]
  end

  def show
    @pets = Pet.all
    @pet_id = params[:pet_id]
  end
end
