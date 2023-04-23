class GenerateUserBillsJob < ApplicationJob
  queue_as :default

  def perform(user)
    BillGenerator.generate(user)
  end
end
