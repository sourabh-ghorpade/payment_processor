# frozen_string_literal: true

class Card < ApplicationRecord
    belongs_to :user
    has_many :transactions
    has_many :fees

    def previous_month_transactions
        transactions.previous_month
    end

    def total_fees
        fees.sum(:amount)
    end

    # Fee Currency is always in USD
    def fee_currency
        1
    end
end
