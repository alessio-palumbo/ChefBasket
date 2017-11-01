require 'rails_helper'

RSpec.describe "suppliers/show", type: :view do
  before(:each) do
    @supplier = assign(:supplier, Supplier.create!(
      :business_name => "Business Name",
      :address => "Address",
      :abn_number => "Abn Number",
      :contact_number => "Contact Number",
      :supplier_type => "Supplier Type",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Business Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Abn Number/)
    expect(rendered).to match(/Contact Number/)
    expect(rendered).to match(/Supplier Type/)
    expect(rendered).to match(//)
  end
end
