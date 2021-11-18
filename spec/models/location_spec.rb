require 'rails_helper'

RSpec.describe Location, type: :model do
  it "zipcode is required" do 
    location = Location.create()
    expect(location).to_not be_valid
  end

  it "highest_reported returns the largest report" do 
    
    location = Location.create(zipcode: "00000")
    report1 = location.reports.create(inches: "22")
    report2 = location.reports.create(inches: "2")
    
    expect(location.highest_reported).to equal(report1)
  end

  it "sorted_report return the reports from largest to smallest" do 
    location = Location.create(zipcode: "00000")
    report2 = location.reports.create(inches: "2")
    report1 = location.reports.create(inches: "22")

    expect(location.reload.sorted_reports).to eql([report1, report2])
  end

  it "should have many reports" do 
    location = Location.reflect_on_association(:reports)
    expect(location.macro).to eq(:has_many)
  end
end
