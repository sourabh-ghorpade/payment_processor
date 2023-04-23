# frozen_string_literal: true

# This class represents a transaction.
class Transaction < ApplicationRecord
  belongs_to :card, optional: false
  belongs_to :merchant, optional: false
end
