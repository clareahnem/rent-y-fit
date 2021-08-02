FactoryBot.define do
  factory :order do
    booking { nil }
    receipt_url { "MyString" }
    payment_id { "MyString" }
  end
end
