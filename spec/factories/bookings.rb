FactoryBot.define do
  factory :booking do
    item 
    requesting_user_id { 2 }
    status { "pending" }
    no_of_days { 5 }
    start_date { "2021-09-04" }
  end
end
