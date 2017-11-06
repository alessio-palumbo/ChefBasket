require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        :food_business => nil,
        :supplier => nil,
        :gross_total => "9.99",
        :gst => "9.99",
        :order_number => "Order Number"
      ),
      Order.create!(
        :food_business => nil,
        :supplier => nil,
        :gross_total => "9.99",
        :gst => "9.99",
        :order_number => "Order Number"
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Order Number".to_s, :count => 2
  end
end
