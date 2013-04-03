class HomeController < ApplicationController
  def index
    @planet_names = PlanetName.trending
    
  end
  
  def profile
  end
end
