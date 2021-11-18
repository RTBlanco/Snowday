require 'rails_helper'

describe LocationsController do 
  describe " #NEW" do 
    it "renders the NEW page for locations" do 
      get :new
      expect(response).to render_template(:new)
    end
  end


  describe " #SHOW" do 
    before do 
      @location = Location.create(zipcode: "03060")
    end
    it "renders the SHOW page for locations" do
      get :show, params: { id: @location.id } 
      expect(response).to render_template(:show)
    end
  end

  describe " #EDIT" do 
    before do 
      @location = Location.create(zipcode: "03060")
    end
    it "renders the EDIT page for locations" do 
      get :edit, params: {id: @location.id}
      expect(response).to render_template(:edit)
    end
  end

  describe " #INDEX" do 
    it "renders the INDEX page for locations" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe " #CREATE" do 
    it "creates a location" do 
      expect{
        post :create, params: {location: {zipcode: "00000"}}
      }.to change(Location, :count).by(1)
    end
  end

  describe " #UPDATE" do
    before do 
      @location = Location.create(zipcode: "00000")
    end

    it "updates a location" do 
      patch :update, params: { id: @location.id , location: {zipcode: "12345" }}
      @location.reload
      expect(@location.zipcode).to eql("12345")
    end 
    
  end

  describe " #DESTROY" do 
    before do 
      @location = Location.create(zipcode: "03060")
    end

    it "deletes the location" do 
      expect{
        delete :destroy, params: {id: @location.id}
      }.to change(Location, :count).by(-1)
    end
  end

end