class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def new
  end

  def create
    new_shelter = Shelter.create(shelter_params)
   redirect_to "/shelters"
  end

  private

  def shelter_params
    params.permit(:name)
  #   params.permit(:address)
  #   params.permit(:city)
  #   params.permit(:state)
  #   params.permit(:zipcode)
  end
end
