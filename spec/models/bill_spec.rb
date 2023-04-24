require 'rails_helper'

RSpec.describe Bill, type: :model do
  context '.generate' do
    context 'when the card has no transactions' do
      it 'does not generate any bills' do
        card = FactoryBot.create(:card)

        expect do
          described_class.generate(card)
        end.not_to change(Bill, :count)
      end
    end

    context 'when the card has transactions' do
      it 'generates the bills' do
        card = FactoryBot.create(:card)
        transaction_one = FactoryBot.create(:transaction, card: card, amount: 1, amount_currency: 1)
        transaction_two = FactoryBot.create(:transaction, card: card, amount: 2, amount_currency: 1)
        transaction_three = FactoryBot.create(:transaction, card: card, amount: 3, amount_currency: 1)

        expect do
          described_class.generate(card)
        end.to change(Bill, :count).by(1)

        bill = Bill.last
        expect(bill.total_transaction_amount).to eq(6)
        expect(bill.total_transaction_amount_currency).to eq(1)
        expect(bill.card_transactions).to match_array([transaction_one, transaction_two, transaction_three])
      end
    end
  end
end
