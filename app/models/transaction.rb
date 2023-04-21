class Transaction < ApplicationRecord
  belongs_to :card, required: true
  belongs_to :merchant, required: true
end
