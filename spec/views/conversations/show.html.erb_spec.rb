require 'rails_helper'

RSpec.describe "conversations/show", type: :view do
  before(:each) do
    @conversation = assign(:conversation, Conversation.create!(
      :food_business => nil,
      :supplier => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
