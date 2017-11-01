require 'rails_helper'

RSpec.describe "FoodBusinesses", type: :request do
  describe "GET /food_businesses" do
    it "works! (now write some real specs)" do
      get food_businesses_path
      expect(response).to have_http_status(200)
    end
  end
end
