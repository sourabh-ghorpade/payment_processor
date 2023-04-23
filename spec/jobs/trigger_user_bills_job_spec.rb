require 'rails_helper'

RSpec.describe TriggerUserBillsJob, type: :job do
  context 'when the job is performed' do
    it 'triggers the user bills job for each user' do
      user_one = FactoryBot.create(:user)
      user_two = FactoryBot.create(:user)
      expect(GenerateUserBillsJob).to receive(:perform_later).with(user_one.id)
      expect(GenerateUserBillsJob).to receive(:perform_later).with(user_two.id)

      described_class.perform_now
    end
  end
end
