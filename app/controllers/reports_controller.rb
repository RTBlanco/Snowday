class ReportsController < ApplicationController

  def new 
    @report = Report.new
  end

  def create
    @report = Location.find(params[:location_id]).reports.build(report_params)
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

end
