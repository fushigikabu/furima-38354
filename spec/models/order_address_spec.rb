require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入に必要な情報保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end
    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'building.nameは空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'tokenが空だと保存できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it 'postal_codeが空だと保存できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'postal_codeにハイフンを含めないと保存できないこと' do
        @order_address.postal_code = 1_111_111
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号が正しく入力されていません。ハイフン(-)を含めてください')
      end
      it 'prefecture_idは1以外を選択しないと保存できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県、の項目を選択してください")
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'house_numberが空だと保存できないこと' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numberは全角だと保存できないこと' do
        @order_address.phone_number = '１１１１１１１１１１１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は、ハイフン(-)を含めず半角数字の10~11文字で入力してください。')
      end
      it 'phone_numberは9文字以下だと保存できないこと' do
        @order_address.phone_number = 123_456_789
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は、ハイフン(-)を含めず半角数字の10~11文字で入力してください。')
      end
      it 'phone_numberは12文字以上だと保存できないこと' do
        @order_address.phone_number = 123_456_789_012
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は、ハイフン(-)を含めず半角数字の10~11文字で入力してください。')
      end
      it 'userが紐づいてないとorder_addressは登録できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'itemが紐づいてないとorder_addressは登録できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end
