require 'rails_helper'

RSpec.describe User, type: :model do
  # ユーザー基本情報の入力
  before do
    @user = FactoryBot.build(:user)
  end


  # ユーザー新規登録に関するテストコード
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'すべての情報が入力されていれ登録できる' do
        expect(@user).to be_valid
      end
    end
    
    context '新規登録できないとき' do
      # ユーザー情報に関するテストコード
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email can't be blank")
      end
      it '同じemailは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include ("Email has already been taken")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'as90Fgco'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email is invalid")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password can't be blank")
      end
      it 'passwordは6文字以上でなければ登録できない' do
        @user.password = 'Abc3f'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is too short (minimum is 6 characters)")
      end
      it 'passwordは数字だけで登録できない' do
        @user.password = '1234567'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password には英字と数字の両方を含めて半角で設定してください")
      end
      it 'passwordは英字だけで登録できない' do
        @user.password = 'AbcDefgr'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password には英字と数字の両方を含めて半角で設定してください")
      end
      it 'passwordは全角だと登録できない' do
        @user.password = "Abあいうえおか678"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password には英字と数字の両方を含めて半角で設定してください")
      end
      it 'passwordとpassword_confirmationは同じでなければ登録できない' do
        @user.password = 'Abc123s'
        @user.password_confirmation = 'Edf907e'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
      end
      # ユーザーの名前情報に関するテストコード
      it '名字が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name can't be blank")
      end
      it '名字が半角では登録できない' do
        @user.last_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name 全角文字を使用してください")
      end
      it '名前が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name can't be blank")
      end
      it '名前が半角では登録できない' do
        @user.first_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name 全角文字を使用してください")
      end
      it '名字カナが空では登録できない' do
        @user.last_name_k = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name k can't be blank")
      end
      it '名字カナが意外では登録できない' do
        @user.last_name_k = '山本'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name k 全角文字を使用してください")
      end
      it '名前カナが空では登録できない' do
        @user.first_name_k = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name k can't be blank")
      end
      it '名前カナがカナ以外では登録できない' do
        @user.first_name_k = '芳樹'
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name k 全角文字を使用してください")
      end
      # ユーザーの生年月日情報に関するテストコード
      it '生年月日が空では登録できない' do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Date of birth can't be blank")
      end
    end
  end
end
