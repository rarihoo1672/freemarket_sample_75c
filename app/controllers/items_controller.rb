class ItemsController < ApplicationController

  def index
    @items = Item.on_sell.includes([:images]).order(created_at: :desc)
  end

  def new
    @item = Item.new
    @parents = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @parents << parent.name
    end
    @item.images.new
  end

  def create
  end

  def show
    category_id = Item.find(params[:id]).category_id
    @this_category = Category.find(category_id)
    @parent_category = @this_category.parent unless @this_category == nil
    @grandparent_category = @parent_category.parent unless @parent_category == nil
  end

  def item_purchase
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find_by(name: "#{params[:child_name]}").children
  end

  private

  def item_params
    reject = %w()
    columns = Item.column_symbolized_names(reject).push(images_attributes: [:image]).push(:prefecture_id)
    params.require(:item).permit(*columns)
  end
end
