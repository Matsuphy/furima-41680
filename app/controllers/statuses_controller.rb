class StatusesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :find_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @status_buyer = StatusBuyer.new
  end


  def create
    @status_buyer = StatusBuyer.new(status_params)
    if @status_buyer.valid?
      @status_buyer.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def status_params
    params.require(:status_buyer).permit(:post_code, :region_id, :city, :street, :room, :phone_number ).merge(item_id: params[:item_id], user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if @item.status.present?
      redirect_to root_path
    end
  end
end
