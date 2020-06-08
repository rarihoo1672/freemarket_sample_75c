class ItemsController < ApplicationController
  require 'payjp'
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show, :purchase, :pay, :done]
  before_action :set_image, only: [:purchase, :done]
  before_action :set_card, only: [:purchase, :pay]

  def index
    @items = Item.on_sell.includes([:images]).order(created_at: :desc)
    # @ladies_items = Item.where(category_id: 1..199).limit(3)
    # @adidas_items = Item.where(brand_id: 3).limit(3)
  end



  def new
    @item = Item.new
    @parents = Category.where(ancestry: nil).pluck(:name).unshift("---")
    @item.images.new
    @item.build_brand
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @parents = Category.where(ancestry: nil).pluck(:name).unshift("---")
      @item.images.new
      render :new
    end
  end

  def edit
    if @item.user != current_user
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    category_id = @item.category_id
    @this_category = Category.find(category_id)
    @parent_category = @this_category.parent unless @this_category == nil
    @grandparent_category = @parent_category.parent unless @parent_category == nil
  end

  def item_purchase
  end

  def purchase
    if @card.blank?
      redirect_to controller: "user", action: "add_card"
    else
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    Payjp::Charge.create(
    amount: @item.price,
    customer: @card.customer_id,
    currency: 'jpy',
    )
    redirect_to action: 'done'
  end

  def done
    @item.update_attribute(:buyer, 1)
  end

  def get_category_children
    @category_children = Category.find_by(id: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @child_category = Category.find(params[:child_name])
    @category_grandchildren = @child_category.children
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :introduction, :status, :size, :shipping_cost, :shipping_days, :prefecture_id, :category_id, :buyer, brand_attributes: [:id, :name], images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_image
    @image = Image.find(params[:id])
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

end

