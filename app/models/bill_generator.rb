class BillGenerator
    def self.generate(user)
        user.cards.each {|card| Bill.generate(card) }
    end
end