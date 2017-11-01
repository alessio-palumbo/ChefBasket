require 'rails_helper'

RSpec.describe "Suppliers", type: :request do
  describe "GET /suppliers" do
    it "works! (now write some real specs)" do
      get suppliers_path
      expect(response).to have_http_status(200)
    end
  end
end
