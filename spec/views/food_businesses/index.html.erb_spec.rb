require 'rails_helper'

RSpec.describe "food_businesses/index", type: :view do
  before(:each) do
    assign(:food_businesses, [
      FoodBusiness.create!(
        :business_name => "Business Name",
        :address => "Address",
        :abn_number => "Abn Number",
        :contact_number => "Contact Number",
        :business_category => "Business Category",
        :user => nil
      ),
      FoodBusiness.create!(
        :business_name => "Business Name",
        :address => "Address",
        :abn_number => "Abn Number",
        :contact_number => "Contact Number",
        :business_category => "Business Category",
        :user => nil
      )
    ])
  end

  it "renders a list of food_businesses" do
    render
    assert_select "tr>td", :text => "Business Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Abn Number".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Number".to_s, :count => 2
    assert_select "tr>td", :text => "Business Category".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
