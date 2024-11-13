class StatusesController < ApplicationController

  def index
    @status_buyer = StatusBuyer.new
  end


  def create
    @status_buyer = StatusBuyer.new(status_params)
    if @status_buyer.valid?
      @status_buyer.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def status_params
    params.require(:status_buyer).permit(:post_code, :region_id, :city, :street, :room, :phone_number ).merge(item_id: item_id, user_id: current_user.id)
  end
end
