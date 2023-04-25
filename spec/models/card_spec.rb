require 'rails_helper'

RSpec.describe Card, type: :model do
    context '.previous_month_transactions' do
        it 'returns the transactions for the previous month' do
            card = FactoryBot.create(:card)
            previous_month_transactions = [double(Transaction), double(Transaction)]
            all_transactions = double(:transactions, previous_month: previous_month_transactions)

            expect(card).to receive(:transactions).and_return(all_transactions)
            expect(card.previous_month_transactions).to eq(previous_month_transactions)
        end
    end
end