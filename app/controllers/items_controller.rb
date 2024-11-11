class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :update]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit( :name, :item_description, :category_id, :condition_id, 
                                  :price, :shipping_fee_id, :shipping_day_id, :region_id, :image,
                                  ).merge(user_id: current_user.id)
  end

  def move_to_index
    item = Item.find(params[:id])
    unless user_signed_in? && current_user == item.user
      redirect_to action: :index
    end
  end

end
