FactoryBot.define do
  factory :booking do
    item { nil }
    requesting_user { nil }
    status { 1 }
    no_of_days { 1 }
    start_date { "2021-08-02" }
  end
end
