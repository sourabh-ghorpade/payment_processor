FactoryBot.define do
    factory :transaction do
        amount { Faker::Number.decimal(l_digits: 2) }
        card
        merchant
    end
end