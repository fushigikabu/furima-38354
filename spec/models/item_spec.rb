require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '商品登録できる時' do
      it '入力項目全て存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品登録できない時' do
      it 'imageが空だと登録出来ない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品画像を入力してください")
      end
      it 'nameが空だと登録出来ない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'textが空だと登録出来ない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'genre_idは、1 以外を選択しないと登録出来ない' do
        @item.genre_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品のカテゴリー、の項目を選択してください")
      end
      it 'item_condition_idは、1 以外を選択しないと登録出来ない' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態、の項目を選択してください")
      end
      it 'delivery_charge_idは、1 以外を選択しないと登録出来ない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担、の項目を選択してください")
      end
      it 'prefecture_idは、1 以外を選択しないと登録出来ない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域、の項目を選択してください")
      end
      it 'delivery_time_idは、1 以外を選択しないと登録出来ない' do
        @item.delivery_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数、の項目を選択してください")
      end
      it 'item_priceは空だと登録出来ない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end
      it 'item_priceに半角数字以外が含まれている場合は出品できない' do
        @item.item_price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end
      it 'item_priceは、300以上でないと登録出来ない' do
        @item.item_price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
      end
      it 'item_priceは、9999999以下でないと登録出来ない' do
        @item.item_price = 99_999_999
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は9999999以下の値にしてください')
      end
      it 'userが紐付いていないとitemは登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('ユーザーを入力してください')
      end
    end
  end
end
