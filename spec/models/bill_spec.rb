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
      it 'generates the bills for only previous month with additional fees' do
        card = FactoryBot.create(:card)
        previous_month_txn_one = FactoryBot.create(:transaction, card: card, amount: 1, amount_currency: 1, transaction_date: 1.month.ago.beginning_of_month)
        previous_month_txn_two = FactoryBot.create(:transaction, card: card, amount: 2, amount_currency: 1, transaction_date: 1.month.ago.end_of_month)
        current_month_txn = FactoryBot.create(:transaction, card: card, amount: 2, amount_currency: 1, transaction_date: Date.today)
        three_months_old_txn = FactoryBot.create(:transaction, card: card, amount: 3, amount_currency: 1, transaction_date: 3.months.ago.beginning_of_month)
        expect(card).to receive(:total_fees).and_return(2)
        expect(card).to receive(:fee_currency).and_return(1)

        expect do
          described_class.generate(card)
        end.to change(Bill, :count).by(1)

        bill = Bill.last
        expect(bill.total_transaction_amount).to eq(3)
        expect(bill.total_transaction_amount_currency).to eq(1)
        expect(bill.additional_fees_amount).to eq(2)
        expect(bill.additional_fees_amount_currency).to eq(1)
        expect(bill.card_transactions).to match_array([previous_month_txn_one, previous_month_txn_two])
      end
    end
  end
end
