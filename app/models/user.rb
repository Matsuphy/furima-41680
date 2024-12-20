class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :statuses

  validates :nickname, presence: true
  validates :last_name, presence: true,     format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
  validates :first_name, presence: true,    format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
  validates :last_name_k, presence: true,   format: { with: /\A[ァ-ヶー]+\z/, message: '全角文字を使用してください' }
  validates :first_name_k, presence: true,  format: { with: /\A[ァ-ヶー]+\z/, message: '全角文字を使用してください' }
  validates :date_of_birth, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて半角で設定してください'

end