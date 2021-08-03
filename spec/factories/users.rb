FactoryBot.define do
  factory :user do
    username {"username"}
    first_name {"first"}
    last_name {"last"}
    email {"email@email.com"}
    password {"password"}
    password_confirmation {"password"}
  end
end
