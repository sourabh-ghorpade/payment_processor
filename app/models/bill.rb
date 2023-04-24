class Bill < ApplicationRecord
  belongs_to :card
  has_and_belongs_to_many :card_transactions, 
    join_table: :bills_transactions,
    class_name: 'Transaction',
    association_foreign_key: :transaction_id
end
