class ItemsController < ApplicationController
  def index
  end

  def show
    category = Item.find(params[:id]).category_id
    @category_name = Category.find(category).name
  end

  def item_purchase
  end
end
