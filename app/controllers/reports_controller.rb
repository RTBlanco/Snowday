class ReportsController < ApplicationController
  before_action :set_location
  def new 
    
    @report = Report.new
  end

  def create
    @report = @location.reports.build(report_params)
    if @report.save 
      redirect_to locations_path
    else 
      render :new
    end
  end 

  private 
  
  def report_params
    params.require(:report).permit(:inches)
  end 

  def set_location 
    @location = Location.find(params[:location_id])
  end

end
