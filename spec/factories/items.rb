FactoryBot.define do
  factory :item do
    user { nil }
    category { nil }
    name { "MyString" }
    description { "MyText" }
    condition { 1 }
    availability { false }
    deposit { 1 }
    price_per_day { 1 }
  end
end
