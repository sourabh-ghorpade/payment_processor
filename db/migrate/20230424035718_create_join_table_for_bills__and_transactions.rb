class CreateJoinTableForBillsAndTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :bills_transactions, id: false do |t|
      t.belongs_to :bill
      t.belongs_to :transaction
    end
  end
end