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

    context '.total_fees' do
        context 'when there are no fees' do
            it 'returns 0' do
                card = FactoryBot.create(:card)
                
                expect(card.total_fees).to eq(0)
            end
        end
        context 'when there are fees' do
            it 'returns the total fees for the card' do
                card = FactoryBot.create(:card, fees: [Fee.new(amount: 1),
                                                        Fee.new(amount: 2)])
                
                
                expect(card.total_fees).to eq(3)
            end
        end
    end

    context '.fee_currency' do
        context 'it returns USD (1)' do
            it 'returns the fee currency for the card' do
                card = FactoryBot.create(:card)
                
                expect(card.fee_currency).to eq(1)
            end
        end
    end
end