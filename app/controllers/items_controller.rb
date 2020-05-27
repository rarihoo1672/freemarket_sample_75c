class ItemsController < ApplicationController
  before_action :index

  def index
    @items = Item.on_sell.includes([:images]).order(created_at: :desc).limit(3)
  end

  def show

  end

  def item_purchase
  end
end
