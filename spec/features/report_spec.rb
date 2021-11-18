require "rails_helper"

describe "New views" do 
  before do 
    @location = Location.create(zipcode: "000000")
  end

  it "created a new report and redirect to home" do 
    visit new_location_report_path(@location)

    fill_in "report[inches]", with: "12"
    click_on "Create Report"
    expect(page).to have_current_path locations_path
    expect(page).to have_content "12" 
  end
end
