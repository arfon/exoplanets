class HomeController < ApplicationController
  def index
    @planets = Planet.for_naming
  end
  
  def profile
  end
end
