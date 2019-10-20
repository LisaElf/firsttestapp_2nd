FactoryBot.define do
  sequence(:email) {|n| "user#{n}@example.com"}
  factory :user do
    email
    password "test123456"
    first_name "Rosa"
    last_name "Luxemburg"
    admin false
  end
end
