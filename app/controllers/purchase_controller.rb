class PurchaseController < ApplicationController
  # require 'payjp'
  # before_action :item_params

  # def index
  #   card = Card.where(user_id: current_user.id).first
  #   if card.blank?
  #     redirect_to controller: "user", action: "add_card"
  #   else
  #     customer = Payjp::Customer.retrieve(card.customer_id)
  #     @card_information = customer.cards.retrieve(card.card_id)
  #   end
  # end

  # def pay
  #   card = Card.where(user_id: current_user.id).first
  #   #@item = Item.find(params[:id])
  #   Payjp::Charge.create(
  #   amount: @item.price,
  #   customer: card.customer_id,
  #   currency: 'jpy',
  #   )
  #   redirect_to action: 'done'
  # end

  private

  def item_params
    @item = params.require(:item).permit(:name, :price).merge(user_id: current_user.id)
  end
end
