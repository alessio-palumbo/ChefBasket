require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      :supplier => nil,
      :order => nil,
      :category => "MyString",
      :name => "MyString",
      :quantifier => "MyString",
      :stock_level => 1,
      :price => "9.99",
      :discount => "9.99"
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input[name=?]", "product[supplier_id]"

      assert_select "input[name=?]", "product[order_id]"

      assert_select "input[name=?]", "product[category]"

      assert_select "input[name=?]", "product[name]"

      assert_select "input[name=?]", "product[quantifier]"

      assert_select "input[name=?]", "product[stock_level]"

      assert_select "input[name=?]", "product[price]"

      assert_select "input[name=?]", "product[discount]"
    end
  end
end
