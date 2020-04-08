class CardController < ApplicationController
  require "payjp"

  def new
    @card = Card.new
    card = Card.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end

  def create
    Payjp.api_key = "sk_test_cf98ef02cadd3ab814d4dc9e"
    if params['payjpToken'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(card: params['payjpToken'])
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save!
        redirect_to card_path(@card)
      else
        redirect_to action: "create"
      end
    end
  end

  def show
    @card = Card.find(params[:id])
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "create"
    else
    Payjp.api_key = "sk_test_cf98ef02cadd3ab814d4dc9e"
    customer = Payjp::Customer.retrieve(card.customer_id)
    @default_card_information = Payjp::Customer.retrieve(card.customer_id).cards.data[0]
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to root_path
  end

end
