require 'rails_helper'

RSpec.describe User, type: :model do
  # ユーザー基本情報の入力
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    # ユーザー新規登録に関するテストコード
    # ユーザー情報に関するテストコード
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      binding.pry
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it '同じemailは登録できない' do
      another_user = FactoryBot.build(:user)
      another_user = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include
    end
    it 'emailは@を含まないと登録できない' do

    end
    it 'passwordが空では登録できない' do

    end
    it 'passwordは半角英数字混合の入力でなければ登録できない' do

    end
    it 'passwordとpassword_confirmationは同じでなければ登録できない' do

    end
    # ユーザー本人情報に関するテストコード
    it '' do
      
    end
    it '' do
      
    end
    it '' do
      
    end
  end
end
