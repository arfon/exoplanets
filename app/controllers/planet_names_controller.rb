class PlanetNamesController < ApplicationController
  before_filter :require_user, :except => :show
  
  def new
    @name = PlanetName.new
  end
  
  def create
    @name = PlanetName.new(params[:planet_name])
    
    @name.user = current_user
    if @name.save
      redirect_to name_path(@name)
    else
      flash[:notice] = t(:name_save_error)
      render :new
    end
  end
  
  def show
    @planet = PlanetName.find(params[:id])
  end
end