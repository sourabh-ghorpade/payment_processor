require 'rails_helper'

describe BillGenerator do
    describe '.generate' do
        context 'when the user has no transactions' do
            it 'does not generate any bills' do
                user = FactoryBot.create(:user)
        
                expect do
                described_class.generate(user)
                end.not_to change(Bill, :count)
            end
        end
    
        context 'when the user has transactions' do
            it 'generates the bills' do
                user = FactoryBot.create(:user)
                card = FactoryBot.create(:card, user: user)
                transaction_one = FactoryBot.create(:transaction, card: card, amount: 1, amount_currency: 1)
                transaction_two = FactoryBot.create(:transaction, card: card, amount: 2, amount_currency: 1)
                transaction_three = FactoryBot.create(:transaction, card: card, amount: 3, amount_currency: 1)
        
                expect do
                described_class.generate(user)
                end.to change(Bill, :count).by(1)
        
                bill = Bill.last
                # expect(bill.total_transaction_amount).to eq(6)
                expect(bill.total_transaction_amount_currency).to eq(1)
                expect(bill.card_transactions).to match_array([transaction_one, transaction_two, transaction_three])
            end
        end
    end
end