require 'rails_helper'

RSpec.describe Fee, type: :model do
  context 'associations' do
    it { should belong_to(:card) }
  end
end
