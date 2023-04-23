class TriggerUserBillsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    User.find_each do |user|
      GenerateUserBillsJob.perform_later(user)
    end
  end
end
