# frozen_string_literal: true

# This class represents a transaction.
class Transaction < ApplicationRecord
  belongs_to :card, optional: false
  belongs_to :merchant, optional: false

  def self.previous_month
    where(transaction_date: 1.month.ago.beginning_of_month..1.month.ago.end_of_month)
  end
end
