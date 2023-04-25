require 'rails_helper'

RSpec.describe Transaction, type: :model do
    context '.previous_month' do
        context 'when there are no transactions' do
            it 'returns an empty array' do
                expect(Transaction.previous_month).to eq([])
            end
        end
        context 'when there are transactions' do
            it 'returns the transactions for the previous month' do
                previous_month_txn_one = FactoryBot.create(:transaction, amount: 1, amount_currency: 1, transaction_date: 1.month.ago.beginning_of_month)
                previous_month_txn_two = FactoryBot.create(:transaction, amount: 2, amount_currency: 1, transaction_date: 1.month.ago.end_of_month)
                current_month_txn = FactoryBot.create(:transaction, amount: 2, amount_currency: 1, transaction_date: Date.today)
                three_months_old_txn = FactoryBot.create(:transaction, amount: 3, amount_currency: 1, transaction_date: 3.months.ago.beginning_of_month)

                expect(Transaction.previous_month).to match_array([previous_month_txn_one, previous_month_txn_two])
            end
        end
    end
end