require "rails_helper"

RSpec.describe FoodBusinessesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/food_businesses").to route_to("food_businesses#index")
    end

    it "routes to #new" do
      expect(:get => "/food_businesses/new").to route_to("food_businesses#new")
    end

    it "routes to #show" do
      expect(:get => "/food_businesses/1").to route_to("food_businesses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/food_businesses/1/edit").to route_to("food_businesses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/food_businesses").to route_to("food_businesses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/food_businesses/1").to route_to("food_businesses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/food_businesses/1").to route_to("food_businesses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/food_businesses/1").to route_to("food_businesses#destroy", :id => "1")
    end

  end
end
