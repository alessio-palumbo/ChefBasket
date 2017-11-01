require 'rails_helper'

RSpec.describe "suppliers/index", type: :view do
  before(:each) do
    assign(:suppliers, [
      Supplier.create!(
        :business_name => "Business Name",
        :address => "Address",
        :abn_number => "Abn Number",
        :contact_number => "Contact Number",
        :supplier_type => "Supplier Type",
        :user => nil
      ),
      Supplier.create!(
        :business_name => "Business Name",
        :address => "Address",
        :abn_number => "Abn Number",
        :contact_number => "Contact Number",
        :supplier_type => "Supplier Type",
        :user => nil
      )
    ])
  end

  it "renders a list of suppliers" do
    render
    assert_select "tr>td", :text => "Business Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Abn Number".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Number".to_s, :count => 2
    assert_select "tr>td", :text => "Supplier Type".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
