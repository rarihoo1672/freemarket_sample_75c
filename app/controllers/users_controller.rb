class UsersController < ApplicationController

  def show
  end

  def log_out
  end

  def card
    @cards = current_user.cards
    if @cards.present?
      @card_information = []
      @cards.each_with_index do |card, i|
        customer = Payjp::Customer.retrieve(card.customer_id)
        @card_information[i] = customer.cards.retrieve(card.card_id)
      end
    end
  end

  def delivery_address
  end

  def user_information
  end

end