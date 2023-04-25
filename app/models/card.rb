# frozen_string_literal: true

class Card < ApplicationRecord
    belongs_to :user
    has_many :transactions

    def previous_month_transactions
        transactions.previous_month
    end
end
