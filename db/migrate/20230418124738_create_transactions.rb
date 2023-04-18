class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :card, null: false, foreign_key: true
      t.references :merchant, null: false, foreign_key: true
      t.decimal :amount
      t.integer :amount_currency
      t.string :summary

      t.timestamps
    end
  end
end
