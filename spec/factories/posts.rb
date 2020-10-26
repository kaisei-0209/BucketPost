FactoryBot.define do
  factory :post do
    content { "MyText" }
    title { "MyString" }
    user { nil }
  end
end
