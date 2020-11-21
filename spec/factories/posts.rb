FactoryBot.define do
  factory :post do
    content { "今年はスカイダインビングをする" }
    title { "人生のやりたいこと" }
    association :user
  end
end
