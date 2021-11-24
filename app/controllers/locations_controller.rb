class LocationsController < ApplicationController
  before_action :set_location, only: [:destroy, :edit, :show, :update]


  def index 
    locations_with_reports = Location.all.select { |location| location.reports.count > 0}
    location_without_reports = Location.all.select{ |location| location.reports.count == 0}

    # possibly faster 
    locations_hash = {
      with: [],
      without: []
    }

    Location.all.each do |location|
      if location.reports.count > 0
        locations_hash[:with] << location
      else
        locations_hash[:without] << location
      end
    end

    @locations = locations_hash[:with].sort_by{|l| l.highest_reported.inches}.reverse + locations_hash[:without]
    # @locations = locations_with_reports.sort_by{|location| location.highest_reported.inches }.reverse + location_without_reports
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
      redirect_to new_location_path, alert: "#{@location.errors.messages[:zipcode][0]}"
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
      redirect_to edit_location_path(@location), alert: "#{@location.errors.messages[:zipcode][0]}"
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
