require 'rails_helper'

describe ReportsController do 
  before do 
    @location = Location.create(zipcode: "00000")
  end

  describe "#NEW" do 
    it "renders the NEW page for reports" do 
      get :new, params: {location_id: @location.id}
      expect(response).to render_template(:new)
    end
  end

  describe "#CREATE" do 
    it "creates a new report " do 
      expect{
        post :create, params: {location_id: @location.id, report: {inches: "22"}}
      }.to change(Report, :count).by(1)
    end
  end
end