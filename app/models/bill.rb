class Bill < ApplicationRecord
  belongs_to :card
  has_and_belongs_to_many :card_transactions, 
    join_table: :bills_transactions,
    class_name: 'Transaction',
    association_foreign_key: :transaction_id

  def self.generate(billable_card)
    return if billable_card.transactions.empty?
    Bill.create!(total_transaction_amount: billable_card.transactions.sum(:amount),
            total_transaction_amount_currency: billable_card.transactions.first.amount_currency,
            card_transactions: billable_card.transactions,
            card: billable_card)
  end
end
