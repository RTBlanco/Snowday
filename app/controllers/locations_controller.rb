class LocationsController < ApplicationController
  before_action :set_location, only: [:destroy, :edit, :show, :update]


  def index 
    @locations = Location.all.sort_by{ |location| location.highest_reported.inches }.reverse  
  end

  def new 
    @location = Location.new
  end

  def create 
    @location = Location.new(location_params)
    if @location.save
      redirect_to locations_path
      flash[:alert] = "Location correctly added"
    else 
      render :new
    end
  end

  def show

  end

  def edit 

  end

  def update    
    if @location.update(location_params)
      redirect_to locations_path
    else 
      redirect_to edit_location_path(@location)
    end
  end

  def destroy 
    @location.destroy
  end

  private 

  def set_location 
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:zipcode)
  end

end
