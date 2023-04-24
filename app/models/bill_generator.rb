class BillGenerator
    def self.generate(user)
      billable_card = user.cards.first
      if billable_card
        Bill.generate(billable_card)
      end
    end
end