require 'rails_helper'

describe BillGenerator do
    describe '.generate' do
        context 'when user has a billable card' do
            it 'generates a bill' do
                user = FactoryBot.create(:user)
                card = FactoryBot.create(:card, user: user)
                expect(Bill).to receive(:generate).with(card)
                BillGenerator.generate(user)
            end
        end
        context 'when user has no billable card' do
            it 'does not generate a bill' do
                user = FactoryBot.create(:user)
                expect(Bill).not_to receive(:generate)
                BillGenerator.generate(user)
            end
        end
    end
end