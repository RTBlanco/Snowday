require 'rails_helper'

RSpec.describe Report, type: :model do
  it "cant be created without a report" do 
    report = Report.create()
    expect(report).to_not be_valid
  end

  it "belongs to a location" do 
    report = Report.reflect_on_association(:location)
    expect(report.macro).to eq(:belongs_to)
  end
end
