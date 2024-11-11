require 'rails_helper'

RSpec.describe Item, type: :model do
  # item情報の基本入力
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報の登録' do
    context '商品が登録できる場合' do
      it 'すべての内容が正しく記載されていると登録できる' do
        expect(@item).to be_valid
      end
    end
    
    context '商品が登録できない場合' do
      # 商品イメージ、名前、内容文章の確認
      it 'imageが空であるとき登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Image can't be blank")
      end
      it 'nameが空であるとき登録できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include ("Name can't be blank")
      end
      it 'nameが41文字以上のとき登録できない' do
        @item.name = "あ" * 41
        @item.valid?
        expect(@item.errors.full_messages).to include ("Name 40文字以内で入力してください")
      end
      it 'item_descriptionが空であるとき登録できない' do
        @item.item_description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include ("Item description can't be blank")
      end
      it 'item_descriptionが1001文字以上であるとき登録できない' do
        @item.item_description = "あ" * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include ("Item description 1000文字以内で入力してください")
      end
      
      # アクティブハッシュの確認
      it 'category_idが空であるとき登録できない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category can't be blank")
      end
      it 'category_idが1以下であるとき登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category is not valid")
      end
      it 'category_idが12以上であるとき登録できない' do
        @item.category_id = 12
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category is not valid")
      end
      it 'condition_idが空であるとき登録できない' do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include ("Condition can't be blank")
      end
      it 'condition_idが1以下であるとき登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Condition is not valid")
      end
      it 'condition_idが8以上であるとき登録できない' do
        @item.condition_id = 8
        @item.valid?
        expect(@item.errors.full_messages).to include ("Condition is not valid")
      end
      it 'shipping_fee_idが空であるとき登録できない' do
        @item.shipping_fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include ("Shipping fee can't be blank")
      end
      it 'shipping_fee_idが1以下であるとき登録できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Shipping fee is not valid")
      end
      it 'shipping_fee_idが4以上であるとき登録できない' do
        @item.shipping_fee_id = 4
        @item.valid?
        expect(@item.errors.full_messages).to include ("Shipping fee is not valid")
      end
      it 'shipping_day_idが空であるとき登録できない' do
        @item.shipping_day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include ("Shipping day can't be blank")
      end
      it 'shipping_day_idが1以下であるとき登録できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Shipping day is not valid")
      end
      it 'shipping_day_idが5以上であるとき登録できない' do
        @item.shipping_day_id = 5
        @item.valid?
        expect(@item.errors.full_messages).to include ("Shipping day is not valid")
      end
      it 'region_idが空であるとき登録できない' do
        @item.region_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include ("Region can't be blank")
      end
      it 'region_idが1以下であるとき登録できない' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Region is not valid")
      end
      it 'region_idが49以上であるとき登録できない' do
        @item.region_id = 49
        @item.valid?
        expect(@item.errors.full_messages).to include ("Region is not valid")
      end

      # プライス情報の確認
      it 'priceが空であるとき登録できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price can't be blank")
      end
      it 'priceが半角整数以外であるとき登録できない' do
        @item.price = "あいうABc"
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price ¥300~¥9,999,999で入力してください")
      end
      it 'priceが299以下であるとき登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price ¥300~¥9,999,999で入力してください")
      end
      it 'priceが10000000以上であるとき登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price ¥300~¥9,999,999で入力してください")
      end
    end
  end
end
