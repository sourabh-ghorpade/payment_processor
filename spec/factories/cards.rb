# frozen_string_literal: true

FactoryBot.define do
  factory :card do
    number { Faker::Number.number(digits: 16) }
    user
  end
end
