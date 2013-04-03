class HomeController < ApplicationController
  def index
    @planet_names = PlanetName.trending
    
  end
end
