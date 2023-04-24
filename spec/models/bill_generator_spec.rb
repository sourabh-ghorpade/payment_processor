require 'rails_helper'

describe BillGenerator do
    describe '.generate' do
        context 'when user has many billable cards' do
            it 'generates a bills per card' do
                user = FactoryBot.create(:user)
                billable_card_one = FactoryBot.create(:card, user: user)
                billable_card_two = FactoryBot.create(:card, user: user)

                expect(Bill).to receive(:generate).with(billable_card_one)
                expect(Bill).to receive(:generate).with(billable_card_two)
                
                BillGenerator.generate(user)
            end
        end
        
        context 'when user has no billable cards' do
            it 'does not generate a bill' do
                user = FactoryBot.create(:user)
                expect(Bill).not_to receive(:generate)
                BillGenerator.generate(user)
            end
        end
    end
end