# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :charity do
    sequence(:name)  { |n| "WeGive#{n}You" }
    sequence(:email) { |n| "charity#{n}@example.com" }
    address "MyString"
    city "MyString"
    state "NY"
    zip_code "11222"
    country "United States"
    password "password"
    password_confirmation "password"
  end
end
