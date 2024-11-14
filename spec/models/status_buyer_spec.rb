require 'rails_helper'

RSpec.describe StatusBuyer, type: :model do
  # status_buyer情報の基本入力
  before do
    @status_buyer = FactoryBot.build(:status_buyer)
  end

  describe '購入の確定と登録' do
    context '購入と登録ができる場合' do
      it 'すべての項目が正しく入力されている' do
        expect(@status_buyer).to be_valid
      end
      it 'room以外のすべての項目が正しく入力されている' do
        @status_buyer.room = ''
        expect(@status_buyer).to be_valid
      end
    end

    context '購入と登録ができない場合' do
      # クレジットカードの情報
      it 'tokenが空であるとき登録できない' do
        @status_buyer.token = ""
        @status_buyer.valid?
        expect(@status_buyer.errors.full_messages).to include ("Token can't be blank")
      end
      # 配送先情報
      it 'post_codeが空であるとき登録できない' do
        @status_buyer.post_code = ""
        @status_buyer.valid?
        expect(@status_buyer.errors.full_messages).to include ("Post code can't be blank")
      end
      it 'post_codeが[数字3桁][-][数字4桁]の形でなければ登録できない' do
        @status_buyer.post_code = "abc-123よ"
        @status_buyer.valid?
        expect(@status_buyer.errors.full_messages).to include ("Post code input correctly")
      end
      it 'region_idが空であるとき登録できない' do
        @status_buyer.region_id = ""
        @status_buyer.valid?
        expect(@status_buyer.errors.full_messages).to include ("Region can't be blank")
      end
      it 'region_idが1以下であるとき登録できない' do
        @status_buyer.region_id = 1
        @status_buyer.valid?
        expect(@status_buyer.errors.full_messages).to include ("Region is not valid")
      end
      it 'region_idが49以上であるとき登録できない' do
        @status_buyer.region_id = 49
        @status_buyer.valid?
        expect(@status_buyer.errors.full_messages).to include ("Region is not valid")
      end
      it 'cityが空であるとき登録できない' do
        @status_buyer.city = ""
        @status_buyer.valid?
        expect(@status_buyer.errors.full_messages).to include ("City can't be blank" )
      end
      it 'streetが空であるとき登録できない' do
        @status_buyer.street = ""
        @status_buyer.valid?
        expect(@status_buyer.errors.full_messages).to include ("Street can't be blank" )
      end
      it 'phone_numberが空であるとき登録できない' do
        @status_buyer.phone_number = ""
        @status_buyer.valid?
        expect(@status_buyer.errors.full_messages).to include ("Phone number can't be blank")
      end
      it 'phone_numberが9桁以下であるとき登録できない' do
        @status_buyer.phone_number = "123456789"
        @status_buyer.valid?
        expect(@status_buyer.errors.full_messages).to include ("Phone number input only 10 or 11 digits number")
      end
      it 'phone_numberが12桁以上であるとき登録できない' do
        @status_buyer.phone_number = "123456789012"
        @status_buyer.valid?
        expect(@status_buyer.errors.full_messages).to include ("Phone number input only 10 or 11 digits number")
      end
    end
  end
end
