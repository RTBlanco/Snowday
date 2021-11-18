require "rails_helper"

describe "Index views" do 
  before do 
    @location = Location.create(zipcode: "03060")
  end

  it "show all the locations" do 
    visit "/locations"
    expect(page).to have_css("tr")
  end

  it "has link to update location" do 
    visit "/locations"
    expect(page).to have_css("a", text: "New Report")
  end


  it 'has "new location" button' do 
    visit "/locations"
    expect(page).to have_css("a", text: "New Location")
  end

  it 'clicking "new Location" button redirects to NEW page' do 
    visit "/locations"
    click_link "New Location"
    expect(page).to have_current_path new_location_path
  end

  it 'clicking "New report" button redirect to edit page' do 
    visit locations_path
    click_link "New Report"
    expect(page).to have_current_path new_location_report_path(@location)
  end
end

describe "New views" do 
  it "show form to create new Location" do 
    visit new_location_path

    fill_in "location[zipcode]", with: "03060"
    
    click_on "Create Location"

    expect(page).to have_current_path locations_path
    expect(page).to have_content "03060"
  end
end

describe "Edit views" do 
  before do 
    @location = Location.create(zipcode: "03060")
  end

  it "shows the form to edit the location" do 
    visit edit_location_path(@location) 

    fill_in "location[zipcode]", with: "12345"
    

    click_on "Update Location"

    expect(page).to have_current_path locations_path
    expect(page).to have_content "12345"

  end
end
