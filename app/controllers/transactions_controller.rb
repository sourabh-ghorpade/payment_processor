class TransactionsController < ApplicationController
  def create
    transaction = Transaction.new(permitted_params)
    if transaction.valid?
      head :created
    else
      head :unprocessable_entity
    end
  end

  def permitted_params
    params.permit(:merchant_id, :card_id, :amount, :amount_currency)
  end
end