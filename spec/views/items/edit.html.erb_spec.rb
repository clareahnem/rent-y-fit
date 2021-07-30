require 'rails_helper'

RSpec.describe "items/edit", type: :view do
  before(:each) do
    @user = User.create(username: "username-test", first_name:"firstname", last_name:"lastname", email:"testing.@test.com", password:"password", password_confirmation:"password")
    @item = assign(:item, Item.create!(
      user: @user.id,
      category: 1,
      name: "MyString",
      description: "MyText",
      condition: 1,
      availability: true,
      deposit: 10000,
      price_per_day: 1000
    ))
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(@item), "post" do

      assert_select "input[name=?]", "item[user_id]"

      assert_select "input[name=?]", "item[category_id]"

      assert_select "input[name=?]", "item[name]"

      assert_select "textarea[name=?]", "item[description]"

      assert_select "input[name=?]", "item[condition]"

      assert_select "input[name=?]", "item[availability]"

      assert_select "input[name=?]", "item[deposit]"

      assert_select "input[name=?]", "item[price_per_day]"
    end
  end
end
