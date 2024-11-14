class StatusBuyer
  include ActiveModel::Model
  attr_accessor :post_code, :region_id, :city, :street, :room, :phone_number, :user_id, :item_id, :token, :price
  # バリデーション
  with_options presence: true do
    validates :post_code,         format:       { with: /\A\d{3}[-]\d{4}\z/, message: "input correctly"}
    validates :region_id,         numericality: { only_integer: true, in: 2..48,        message: "is not valid" }
    validates :city
    validates :street
    validates :phone_number,      format:       { with: /\A\d{10,11}\z/, message: "input only 10 or 11 digits number"}
  
    validates :token
    validates :price,             numericality: { only_integer: true, in: 300..9999999, message: "is not valid"}
  
    validates :user_id
    validates :item_id
  end
  # 保存処理
  def save
    ActiveRecord::Base.transaction do
      status = Status.create(user_id: user_id, item_id: item_id)
      Buyer.create(post_code: post_code, region_id: region_id, city: city, street: street, room: room, phone_number: phone_number, status_id: status.id)
    end
  end
end