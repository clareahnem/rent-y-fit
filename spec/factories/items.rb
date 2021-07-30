FactoryBot.define do
  factory :item do
    user
    category
    name { "Red Bucket Hat" }
    description { "description" }
    condition { 1 }
    availability { true }
    deposit { 10000 }
    price_per_day { 1000 }
  end
end
