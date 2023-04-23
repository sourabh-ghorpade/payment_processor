# frozen_string_literal: true

require 'rails_helper'

describe TransactionsController do
  context 'when all parameters are valid' do
    it 'creates a transaction' do
      merchant = FactoryBot.create(:merchant)
      card = FactoryBot.create(:card)

      expect do
        post :create, params: { merchant_id: merchant.id, card_id: card.id, amount: 1, currency: 'USD' }
        assert_response :created
      end.to change(Transaction, :count).by(1)
      expect(JSON.parse(response.body)).to eq({ 'id' => 1 })
    end
  end

  context 'when some parameters are invalid' do
    context 'when card_id is not correct' do
      context 'when card_id is not present' do
        it 'does not create a transaction' do
          expect { post :create }.to raise_error(ActionController::UrlGenerationError)
        end
      end

      context 'when card id is invalid' do
        it 'when does not create a transaction' do
          merchant = FactoryBot.create(:merchant)
          post :create, params: { merchant_id: merchant.id, card_id: 1, amount: 1, currency: 'USD' }

          assert_response :unprocessable_entity
        end
      end
    end

    context 'when merchant_id is not correct' do
      context 'when merchant_id is not present' do
        it 'does not create a transaction' do
          card = FactoryBot.create(:card)
          post :create, params: { card_id: card.id, amount: 1, currency: 'USD' }

          assert_response :unprocessable_entity
        end
      end

      context 'when merchant id is invalid' do
        it 'does not create a transaction' do
          card = FactoryBot.create(:card)
          post :create, params: { merchant_id: 1, card_id: card.id, amount: 1, currency: 'USD' }

          assert_response :unprocessable_entity
        end
      end
    end
  end
end
