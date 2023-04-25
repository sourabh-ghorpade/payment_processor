class CreateFees < ActiveRecord::Migration[7.0]
  def change
    create_table :fees do |t|
      t.string :description
      t.decimal :amount
      t.string :amount_currency
      t.references :card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
