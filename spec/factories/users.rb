FactoryBot.define do
  factory :user do
    name { "TestUser" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end

  trait :admin do
    name { "AdminUser" }
    email { "admin@example.com" }
    password { "111111" }
    admin { true }
  end
end
