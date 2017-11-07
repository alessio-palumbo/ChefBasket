require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :supplier => nil,
      :order => nil,
      :category => "Category",
      :name => "Name",
      :quantifier => "Quantifier",
      :stock_level => 2,
      :price => "9.99",
      :discount => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Category/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Quantifier/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
  end
end
