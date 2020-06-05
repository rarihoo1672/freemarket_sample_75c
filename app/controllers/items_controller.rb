class ItemsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @items = Item.on_sell.includes([:images]).order(created_at: :desc)
    @ladies_items = Item.where(category_id: 1..199).limit(3)
    @adidas_items = Item.where(brand_id: 3).limit(3)
  end



  def new
    @item = Item.new
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
       @category_parent_array << parent.name
    end
    @item.images.new
  end

  def create
  end

  def show
    @item = Item.find(params[:id])
    category_id = @item.category_id
    @this_category = Category.find(category_id)
    @parent_category = @this_category.parent unless @this_category == nil
    @grandparent_category = @parent_category.parent unless @parent_category == nil
  end

  def item_purchase
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def purchase
    @image = Image.find(params[:id])
    @item = Item.find(params[:id])
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to controller: "user", action: "add_card"
    else
      customer = Payjp::Customer.retrieve(card.customer_id)
      @card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    @item = Item.find(params[:id])
    Payjp::Charge.create(
    amount: @item.price,
    customer: card.customer_id,
    currency: 'jpy',
    )
    redirect_to action: 'done'
  end

  def done
    @image = Image.find(params[:id])
    @item = Item.find(params[:id])
    @item.update_attribute(:buyer, 1)
  end


  private

  def item_params
    reject = %w()
    columns = Item.column_symbolized_names(reject).push(images_attributes: [:image]).push(:prefecture_id)
    params.require(:item).permit(*columns)
  end

end
