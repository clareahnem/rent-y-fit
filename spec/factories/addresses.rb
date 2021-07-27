FactoryBot.define do
  factory :address do
    street_no { "MyString" }
    street { "MyString" }
    suburb { "MyString" }
    postcode { "MyString" }
    user { nil }
  end
end
