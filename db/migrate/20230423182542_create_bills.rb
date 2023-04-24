class CreateBills < ActiveRecord::Migration[7.0]
  def change
    create_table :bills do |t|
      t.references :card, null: false, foreign_key: true
      t.decimal :total_transaction_amount
      t.integer :total_transaction_amount_currency
      t.decimal :additional_fees_amount
      t.integer :additional_fees_amount_currency

      t.timestamps
    end
  end
end
