class ItemsController < ApplicationController
  def index
  end

  def show
    @item = Item.first
  end
end
