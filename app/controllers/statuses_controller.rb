class StatusesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :find_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @status_buyer = StatusBuyer.new
  end


  def create
    @status_buyer = StatusBuyer.new(status_params)
    if @status_buyer.valid?
      pay_item
      @status_buyer.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def status_params
    params.require(:status_buyer).permit(:post_code, :region_id, :city, :street, :room, :phone_number 
    ).merge(
      item_id: params[:item_id], user_id: current_user.id, token: params[:token], price: @item.price
      )
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user == @item.user || @item.status.present?
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: status_params[:price],
      card: status_params[:token],
      currency: 'jpy'
    )
  end
end
