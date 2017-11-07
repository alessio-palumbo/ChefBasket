require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :supplier => nil,
        :order => nil,
        :category => "Category",
        :name => "Name",
        :quantifier => "Quantifier",
        :stock_level => 2,
        :price => "9.99",
        :discount => "9.99"
      ),
      Product.create!(
        :supplier => nil,
        :order => nil,
        :category => "Category",
        :name => "Name",
        :quantifier => "Quantifier",
        :stock_level => 2,
        :price => "9.99",
        :discount => "9.99"
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Quantifier".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
