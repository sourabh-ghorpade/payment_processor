# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_24_043014) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: :cascade do |t|
    t.bigint "card_id", null: false
    t.decimal "total_transaction_amount"
    t.integer "total_transaction_amount_currency"
    t.decimal "additional_fees_amount"
    t.integer "additional_fees_amount_currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_bills_on_card_id"
  end

  create_table "bills_transactions", id: false, force: :cascade do |t|
    t.bigint "bill_id"
    t.bigint "transaction_id"
    t.index ["bill_id"], name: "index_bills_transactions_on_bill_id"
    t.index ["transaction_id"], name: "index_bills_transactions_on_transaction_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "number"
    t.integer "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "merchants", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "card_id", null: false
    t.bigint "merchant_id", null: false
    t.decimal "amount"
    t.integer "amount_currency"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_transactions_on_card_id"
    t.index ["merchant_id"], name: "index_transactions_on_merchant_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bills", "cards"
  add_foreign_key "cards", "users"
  add_foreign_key "transactions", "cards"
  add_foreign_key "transactions", "merchants"
end
