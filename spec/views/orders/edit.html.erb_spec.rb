require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :food_business => nil,
      :supplier => nil,
      :gross_total => "9.99",
      :gst => "9.99",
      :order_number => "MyString"
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input[name=?]", "order[food_business_id]"

      assert_select "input[name=?]", "order[supplier_id]"

      assert_select "input[name=?]", "order[gross_total]"

      assert_select "input[name=?]", "order[gst]"

      assert_select "input[name=?]", "order[order_number]"
    end
  end
end
