# frozen_string_literal: true

class Card < ApplicationRecord
    belongs_to :user
    has_many :transactions

    def previous_month_transactions
        transactions.where(transaction_date: 1.month.ago.beginning_of_month..1.month.ago.end_of_month)
    end
end
