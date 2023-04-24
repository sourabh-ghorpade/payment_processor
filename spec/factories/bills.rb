FactoryBot.define do
  factory :bill do
    card { nil }
    transactions { nil }
    total_transaction_amount { "9.99" }
    total_transaction_amount_currency { 1 }
    additional_fees_amount { "9.99" }
    additional_fees_amount_currency { 1 }
  end
end
