FactoryBot.define do
  factory :order do
    booking 
    receipt_url { "receipt" }
    payment_id { "payment" }
  end
end
