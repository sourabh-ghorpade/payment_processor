class Bill < ApplicationRecord
  belongs_to :card
  has_and_belongs_to_many :card_transactions,
    join_table: :bills_transactions,
    class_name: 'Transaction',
    association_foreign_key: :transaction_id

  def self.generate(billable_card)
    return if billable_card.transactions.empty?
    # TODO: Handle february dates where one month might result in a previous month
    previous_month_transactions = billable_card.previous_month_transactions
    Bill.create!(total_transaction_amount: previous_month_transactions.sum(:amount),
            total_transaction_amount_currency: previous_month_transactions.first.amount_currency,
            card_transactions: previous_month_transactions,
            card: billable_card)
  end
end
