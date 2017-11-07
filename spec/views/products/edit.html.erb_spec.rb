require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
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

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

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
