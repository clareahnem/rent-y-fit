FactoryBot.define do
  factory :address do
    street_no { "123" }
    street { "Sesame Street" }
    suburb { "Melbourne" }
    postcode { "3000" }
    user
  end
end
