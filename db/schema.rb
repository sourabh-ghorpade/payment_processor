# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_230_421_115_407) do
  create_table 'cards', force: :cascade do |t|
    t.string 'number'
    t.integer 'type'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'dummies', force: :cascade do |t|
    t.integer 'a'
    t.string 'b'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'merchants', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'transactions', force: :cascade do |t|
    t.integer 'card_id', null: false
    t.integer 'merchant_id', null: false
    t.decimal 'amount'
    t.integer 'amount_currency'
    t.string 'summary'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['card_id'], name: 'index_transactions_on_card_id'
    t.index ['merchant_id'], name: 'index_transactions_on_merchant_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email'
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'transactions', 'cards'
  add_foreign_key 'transactions', 'merchants'
end
