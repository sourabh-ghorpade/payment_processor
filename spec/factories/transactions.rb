FactoryBot.define do
    factory :transaction do
        amount { Faker::Number.decimal(l_digits: 2) }
        transaction_date { Faker::Date.between(from: 1.year.ago, to: Date.today) }
        card
        merchant
    end
end