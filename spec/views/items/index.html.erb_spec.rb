require 'rails_helper'

# RSpec.describe "items/index", type: :view do
#   before(:each) do
#     assign(:items, [
#       Item.create!(
#         user: nil,
#         category: nil,
#         name: "Name",
#         description: "MyText",
#         condition: 2,
#         availability: false,
#         deposit: 3,
#         price_per_day: 4
#       ),
#       Item.create!(
#         user: nil,
#         category: nil,
#         name: "Name",
#         description: "MyText",
#         condition: 2,
#         availability: false,
#         deposit: 3,
#         price_per_day: 4
#       )
#     ])
#   end

#   it "renders a list of items" do
#     render
#     assert_select "tr>td", text: nil.to_s, count: 2
#     assert_select "tr>td", text: nil.to_s, count: 2
#     assert_select "tr>td", text: "Name".to_s, count: 2
#     assert_select "tr>td", text: "MyText".to_s, count: 2
#     assert_select "tr>td", text: 2.to_s, count: 2
#     assert_select "tr>td", text: false.to_s, count: 2
#     assert_select "tr>td", text: 3.to_s, count: 2
#     assert_select "tr>td", text: 4.to_s, count: 2
#   end
# end
