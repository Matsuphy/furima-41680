class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name,              presence: true, length: { maximum: 40 }
  validates :item_description,  presence: true, length: { maximum: 1000 }
  validates :price,             presence: true
  validates :image,             presence: true



  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :condition
    belongs_to_active_hash :shipping_fee
    belongs_to_active_hash :shipping_day
    belongs_to_active_hash :region


    validates :category_id,     numericality: { other_than: 1, message: "can't be blank" } 
    validates :condition_id,    numericality: { other_than: 1, message: "can't be blank" } 
    validates :shipping_fee_id, numericality: { other_than: 1, message: "can't be blank" } 
    validates :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" } 
    validates :region_id,       numericality: { other_than: 1, message: "can't be blank" } 
end
