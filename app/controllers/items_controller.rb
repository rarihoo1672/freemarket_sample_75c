class ItemsController < ApplicationController
  require 'payjp'
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show, :purchase, :pay, :done, :destroy]
  before_action :set_card, only: [:purchase, :pay]
  before_action :size, :status, :shipping_cost, :shipping_days, only: [:edit]


  def index
    @items = Item.on_sell.includes([:images]).order(created_at: :desc)
    @ladies_items = Item.where(category_id: 1..199).limit(3)
    @item_lists = Item.where.not(category_id: 1..199).limit(3)
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
    else
      @item.images.new
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
    @item = Item.find(params[:id])
    category_id = @item.category_id
    @this_category = Category.find(category_id)
    @parent_category = @this_category.parent unless @this_category == nil
    @grandparent_category = @parent_category.parent unless @parent_category == nil
    @user = @item.user
    @prefecture = @user.address.prefecture
    @comment = Comment.new
    @comments = @item.comments
  end

  def destroy
    if user_signed_in? && current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    if user_signed_in? && current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def item_purchase
  end

  def purchase
    if @card.blank?
      redirect_to controller: "users", action: "add_card", id: current_user.id
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

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def size
    case @item.size
    when "S"
      @size = 1
    when "M"
      @size = 2
    when "L"
      @size = 3
    when "LL"
      @size = 4
    end
  end

  def status
    case @item.status
    when "brand_new"
      @status = 1
    when "near_to_unused"
      @status = 2
    when "no_scrach"
      @status = 3
    when "slight_scrach"
      @status = 4
    when "has_scrach"
      @status = 5
    when "bad_state"
      @status = 6
    end
  end

  def shipping_cost
    case @item.shipping_cost
    when "listing_person"
      @shipping_cost = 1
    when "buyer_burden"
      @shipping_cost = 2
    end
  end

  def shipping_days
    case @item.shipping_days
    when "early_ship"
      @shipping_days = 1
    when "mid_ship"
      @shipping_days = 2
    when "late_ship"
      @shipping_days = 3
    end
  end

end

