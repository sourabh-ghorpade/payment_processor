FactoryBot.define do
  factory :fee do
    description { "MyString" }
    amount { "9.99" }
    amount_currency { "MyString" }
    card { nil }
  end
end
