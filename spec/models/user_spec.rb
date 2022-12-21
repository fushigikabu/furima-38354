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
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@を含めないと登録出来ない' do
        @user.email = 'testattonashi'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在すると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空だと登録出来ない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが英数字それぞれ1文字以上含まれないと登録出来ない' do
        @user.password = '11111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角6文字以上、英字・数字それぞれ１文字以上含む必要があります')
      end
      it 'passwordとpassword_confirmationgが不一致だと登録できない' do
        @user.password = '1234567a'
        @user.password_confirmation = '1234567b'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '1234a'
        @user.password_confirmation = '1234a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角6文字以上、英字・数字それぞれ１文字以上含む必要があります')
      end
      it 'passwordが半角だと登録できない' do
        @user.password='１１１１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角6文字以上、英字・数字それぞれ１文字以上含む必要があります')
      end
      it 'nicknameが空だと登録出来ない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'first_nameが空だと登録出来ない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameに半角文字が含まれている場合は登録できない' do
        @user.first_name='test'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name は全角ひらがな、全角カタカナ、漢字で入力して下さい")
      end
      it 'last_nameが空だと登録出来ない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameに半角文字が含まれている場合は登録できない' do
        @user.last_name='test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name は全角ひらがな、全角カタカナ、漢字で入力して下さい")
      end
      it 'first_name_readingが空だと登録出来ない' do
        @user.first_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading can't be blank")
      end
      it 'first_name_readingにひらがなが含まれている場合は登録できない' do
        @user.first_name_reading='てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading は全角カタカナで入力して下さい")
      end
      it 'first_name_readingに漢字が含まれている場合は登録できない' do
        @user.first_name_reading='田中'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading は全角カタカナで入力して下さい")
      end
      it 'last_name_readingが空だと登録出来ない' do
        @user.last_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading can't be blank")
      end
      it 'last_name_readingにひらがなが含まれている場合は登録できない' do
        @user.last_name_reading='てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading は全角カタカナで入力して下さい")
      end
      it 'last_name_readingに漢字が含まれている場合は登録できない' do
        @user.last_name_reading='田中'
        @user.valid?
        binding.pry
        expect(@user.errors.full_messages).to include("Last name reading は全角カタカナで入力して下さい")
      end
      it 'birthdayが空だと登録出来ない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
