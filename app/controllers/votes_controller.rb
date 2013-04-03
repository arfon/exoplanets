class VotesController < ApplicationController
  respond_to :js
  
  def create
    @planet = PlanetName.find(params[:planet_name_id])
    
    
  end
end
