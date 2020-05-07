class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def shelter_info
    @shelter = Shelter.find(params[:id])
  end

end
