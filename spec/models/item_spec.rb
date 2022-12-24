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
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと登録出来ない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'textが空だと登録出来ない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'genre_idは、1 以外を選択しないと登録出来ない' do
        @item.genre_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre can't be blank")
      end
      it 'item_condition_idは、1 以外を選択しないと登録出来ない' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end
      it 'delivery_charge_idは、1 以外を選択しないと登録出来ない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it 'prefecture_idは、1 以外を選択しないと登録出来ない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'delivery_time_idは、1 以外を選択しないと登録出来ない' do
        @item.delivery_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be blank")
      end
      it 'item_priceは空だと登録出来ない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end
      it 'item_priceに半角数字以外が含まれている場合は出品できない' do
        @item.item_price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end
      it 'item_priceは、300以上でないと登録出来ない' do
        @item.item_price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be greater than or equal to 300')
      end
      it 'item_priceは、9999999以下でないと登録出来ない' do
        @item.item_price = 99_999_999
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be less than or equal to 9999999')
      end
      it 'userが紐付いていないとitemは登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

    end
  end
end
