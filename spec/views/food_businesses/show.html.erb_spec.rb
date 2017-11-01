require 'rails_helper'

RSpec.describe "food_businesses/show", type: :view do
  before(:each) do
    @food_business = assign(:food_business, FoodBusiness.create!(
      :business_name => "Business Name",
      :address => "Address",
      :abn_number => "Abn Number",
      :contact_number => "Contact Number",
      :business_category => "Business Category",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Business Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Abn Number/)
    expect(rendered).to match(/Contact Number/)
    expect(rendered).to match(/Business Category/)
    expect(rendered).to match(//)
  end
end
