class Status < ApplicationRecord
  belongs_to :item
  belongs_to :user

  has_one :buyer

end
