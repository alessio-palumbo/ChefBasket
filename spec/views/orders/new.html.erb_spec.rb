require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      :food_business => nil,
      :supplier => nil,
      :gross_total => "9.99",
      :gst => "9.99",
      :order_number => "MyString"
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input[name=?]", "order[food_business_id]"

      assert_select "input[name=?]", "order[supplier_id]"

      assert_select "input[name=?]", "order[gross_total]"

      assert_select "input[name=?]", "order[gst]"

      assert_select "input[name=?]", "order[order_number]"
    end
  end
end
