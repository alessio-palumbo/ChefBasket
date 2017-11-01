require 'rails_helper'

RSpec.describe "food_businesses/edit", type: :view do
  before(:each) do
    @food_business = assign(:food_business, FoodBusiness.create!(
      :business_name => "MyString",
      :address => "MyString",
      :abn_number => "MyString",
      :contact_number => "MyString",
      :business_category => "MyString",
      :user => nil
    ))
  end

  it "renders the edit food_business form" do
    render

    assert_select "form[action=?][method=?]", food_business_path(@food_business), "post" do

      assert_select "input[name=?]", "food_business[business_name]"

      assert_select "input[name=?]", "food_business[address]"

      assert_select "input[name=?]", "food_business[abn_number]"

      assert_select "input[name=?]", "food_business[contact_number]"

      assert_select "input[name=?]", "food_business[business_category]"

      assert_select "input[name=?]", "food_business[user_id]"
    end
  end
end
