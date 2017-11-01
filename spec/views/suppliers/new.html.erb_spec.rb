require 'rails_helper'

RSpec.describe "suppliers/new", type: :view do
  before(:each) do
    assign(:supplier, Supplier.new(
      :business_name => "MyString",
      :address => "MyString",
      :abn_number => "MyString",
      :contact_number => "MyString",
      :supplier_type => "MyString",
      :user => nil
    ))
  end

  it "renders new supplier form" do
    render

    assert_select "form[action=?][method=?]", suppliers_path, "post" do

      assert_select "input[name=?]", "supplier[business_name]"

      assert_select "input[name=?]", "supplier[address]"

      assert_select "input[name=?]", "supplier[abn_number]"

      assert_select "input[name=?]", "supplier[contact_number]"

      assert_select "input[name=?]", "supplier[supplier_type]"

      assert_select "input[name=?]", "supplier[user_id]"
    end
  end
end
