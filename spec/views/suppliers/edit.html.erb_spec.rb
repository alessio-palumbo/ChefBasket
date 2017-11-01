require 'rails_helper'

RSpec.describe "suppliers/edit", type: :view do
  before(:each) do
    @supplier = assign(:supplier, Supplier.create!(
      :business_name => "MyString",
      :address => "MyString",
      :abn_number => "MyString",
      :contact_number => "MyString",
      :supplier_type => "MyString",
      :user => nil
    ))
  end

  it "renders the edit supplier form" do
    render

    assert_select "form[action=?][method=?]", supplier_path(@supplier), "post" do

      assert_select "input[name=?]", "supplier[business_name]"

      assert_select "input[name=?]", "supplier[address]"

      assert_select "input[name=?]", "supplier[abn_number]"

      assert_select "input[name=?]", "supplier[contact_number]"

      assert_select "input[name=?]", "supplier[supplier_type]"

      assert_select "input[name=?]", "supplier[user_id]"
    end
  end
end
