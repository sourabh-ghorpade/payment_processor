FactoryBot.define do
    factory :card do
        number { Faker::Number.number(digits: 16) }
    end
end