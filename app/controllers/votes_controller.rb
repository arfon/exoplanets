class VotesController < ApplicationController
  before_filter :require_user
  respond_to :js
  
  def create
    @planet = PlanetName.find(params[:planet_name_id])
    current_user.vote_for(@planet)
  end
end
