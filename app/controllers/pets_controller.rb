class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end


  def index_specific
    @pets = Pet.all
    @current_shelter = Shelter.find(params[:shelter_id])
    @current_shelter_id = params[:shelter_id]
  end
end
