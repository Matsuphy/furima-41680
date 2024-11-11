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
  validates :name,              presence: true, length: { maximum: 40, message: "40文字以内で入力してください" }
  validates :item_description,  presence: true, length: { maximum: 1000, message: "1000文字以内で入力してください" }
  
  validates :category_id,     numericality: { other_than: 1, message: "can't be blank" } 
  validates :condition_id,    numericality: { other_than: 1, message: "can't be blank" } 
  validates :shipping_fee_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :region_id,       numericality: { other_than: 1, message: "can't be blank" } 

  validates :price,             presence: true, numericality: {only_integer: true, in: 300..9999999, message: "¥300~¥9,999,999で入力してください"}
end
