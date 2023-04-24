class BillGenerator
    def self.generate(user)
      billable_card = user.cards.first
      if billable_card
        Bill.create!(
            total_transaction_amount: billable_card.transactions.sum(:amount),
            total_transaction_amount_currency: billable_card.transactions.first.amount_currency,
            card_transactions: billable_card.transactions,
            card: billable_card)
      end
    end
end