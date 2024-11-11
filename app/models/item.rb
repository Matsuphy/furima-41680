class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :region

  belongs_to :user
  has_one_attached :image

  validates :image,             presence: true
  validates :name,              presence: true, length:       { maximum: 40,      message: "40文字以内で入力してください" }
  validates :item_description,  presence: true, length:       { maximum: 1000,    message: "1000文字以内で入力してください" }
  
  validates :category_id,       presence: true, numericality: { only_integer: true, in: 2..11,        message: "is not valid"}
  validates :condition_id,      presence: true, numericality: { only_integer: true, in: 2..7,         message: "is not valid" } 
  validates :shipping_fee_id,   presence: true, numericality: { only_integer: true, in: 2..3,         message: "is not valid" } 
  validates :region_id,         presence: true, numericality: { only_integer: true, in: 2..48,        message: "is not valid" } 
  validates :shipping_day_id,   presence: true, numericality: { only_integer: true, in: 2..4,         message: "is not valid" } 

  validates :price,             presence: true, numericality: { only_integer: true, in: 300..9999999, message: "¥300~¥9,999,999で入力してください"}
end
