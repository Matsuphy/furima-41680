require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    # ユーザー新規登録に関するテストコード
    it 'nicknameが空だと登録できない' do
      user = FactoryBot.build(:user)
      user.nickname = ''
    end
    it '' do
      
    end
  end
end
