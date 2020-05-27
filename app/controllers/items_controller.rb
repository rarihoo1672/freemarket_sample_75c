class ItemsController < ApplicationController
  def index
  end

  def show
    category = Item.find(params[:id]).category_id
    @this_category = Category.find(category)
    @parent_category = @this_category.parent unless @this_category == nil
    @grandparent_category = @parent_category.parent unless @parent_category == nil
  end

  def item_purchase
  end
end
