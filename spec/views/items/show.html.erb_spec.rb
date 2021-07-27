require 'rails_helper'

RSpec.describe "items/show", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      user: nil,
      category: nil,
      name: "Name",
      description: "MyText",
      condition: 2,
      availability: false,
      deposit: 3,
      price_per_day: 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
