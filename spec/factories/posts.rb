FactoryBot.define do
  factory :post do
    content { "今年はスカイダインビングをする" }
    title { "人生のやりたいこと" }
    association :user
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end
