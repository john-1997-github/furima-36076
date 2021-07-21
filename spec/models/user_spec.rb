require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    it '全ての値が正常' do
      expect(@user).to be_valid
    end
    it 'ニックネームが必須であること' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'メールアドレスが必須であること' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'メールアドレスが一意性であること' do
      user2 = FactoryBot.create(:user)
      @user.email = user2.email
      @user.valid?
      expect(@user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスは、@を含む必要があること' do
      @user.email = '1234.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'パスワードが必須であること。' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードは、6文字以上での入力が必須であること' do
      @user.password = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'パスワードは、半角英数字混合での入力が必須であること' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
      @user.password = 'aaaaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'パスワードは全角では登録できないこと' do
          @user.password = 'aaaaaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'パスワードは英語のみでは登録できないこと' do
      @user.password = 'aaaaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
      end

    it'パスワードは数字のみでは登録できないこと' do
      @user.password = '123123'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
      end
    it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
      @user.password = '123456'
      @user.password_confirmation = '9876834'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'lastnameとfirstnameは必須であること' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'lastnameは全角（漢字・ひらがな・カタカナ）' do
      @user.last_name = 'tanaka'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end
    it 'firstnameは全角（漢字・ひらがな・カタカナ）' do
      @user.first_name = 'tanaka'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end
    it 'last_name_kanaとfirst_name_kanaとは必須であること' do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'last_name_kanaは全角（カタカナ）であること' do
      @user.last_name_kana = 'たなか'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end
    it 'firs_name_kanaは全角（カタカナ）であること' do
      @user.first_name_kana = '田中'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
    it '生年月日が必須であること' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end

