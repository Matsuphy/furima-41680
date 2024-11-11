class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    
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

  private
  def item_params
    params.require(:item).permit( :name, :item_description, :category_id, :condition_id, 
                                  :price, :shipping_fee_id, :shipping_day_id, :region_id, :image,
                                  ).merge(user_id: current_user.id)
  end

end
