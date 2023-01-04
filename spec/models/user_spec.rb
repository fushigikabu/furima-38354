require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it '入力項目全て存在すれば登録できる' do
      end
    end
    context 'ユーザー登録できない時' do
      it 'emailが空だと登録出来ない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'emailに@を含めないと登録出来ない' do
        @user.email = 'testattonashi'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it '重複したemailが存在すると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'passwordが空だと登録出来ない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが英数字それぞれ1文字以上含まれないと登録出来ない' do
        @user.password = '11111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角6文字以上、英字・数字それぞれ１文字以上含む必要があります')
      end
      it 'passwordとpassword_confirmationgが不一致だと登録できない' do
        @user.password = '1234567a'
        @user.password_confirmation = '1234567b'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '1234a'
        @user.password_confirmation = '1234a'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角6文字以上、英字・数字それぞれ１文字以上含む必要があります')
      end
      it 'passwordが半角だと登録できない' do
        @user.password = '１１１１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角6文字以上、英字・数字それぞれ１文字以上含む必要があります')
      end
      it 'nicknameが空だと登録出来ない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'first_nameが空だと登録出来ない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end
      it 'first_nameに半角文字が含まれている場合は登録できない' do
        @user.first_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字は全角ひらがな、全角カタカナ、漢字で入力して下さい')
      end
      it 'last_nameが空だと登録出来ない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'last_nameに半角文字が含まれている場合は登録できない' do
        @user.last_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は全角ひらがな、全角カタカナ、漢字で入力して下さい')
      end
      it 'first_name_readingが空だと登録出来ない' do
        @user.first_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字の読み方を入力してください")
      end
      it 'first_name_readingにひらがなが含まれている場合は登録できない' do
        @user.first_name_reading = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字の読み方は全角カタカナで入力して下さい')
      end
      it 'first_name_readingに漢字が含まれている場合は登録できない' do
        @user.first_name_reading = '田中'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字の読み方は全角カタカナで入力して下さい')
      end
      it 'last_name_readingが空だと登録出来ない' do
        @user.last_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前の読み方を入力してください")
      end
      it 'last_name_readingにひらがなが含まれている場合は登録できない' do
        @user.last_name_reading = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前の読み方は全角カタカナで入力して下さい')
      end
      it 'last_name_readingに漢字が含まれている場合は登録できない' do
        @user.last_name_reading = '田中'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前の読み方は全角カタカナで入力して下さい')
      end
      it 'birthdayが空だと登録出来ない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
    end
  end
end
