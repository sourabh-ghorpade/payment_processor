require 'rails_helper'

RSpec.describe GenerateUserBillsJob, type: :job do
  context 'when the job is performed' do
    it 'generates the user bills' do
      user = FactoryBot.create(:user)
      expect(BillGenerator).to receive(:generate).with(user)

      described_class.perform_now(user)
    end
  end
end
