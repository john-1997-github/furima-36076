require 'rails_helper'

RSpec.describe OrderPurchaseHistory, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_purchase_history = FactoryBot.build(:order_purchase_history, user_id: user.id, item_id: item.id)
      sleep(3)
    end

    context '内容に問題ない場合' do
      it '全ての情報があれば登録できること' do
        expect(@order_purchase_history).to be_valid
      end

      it '建物名は空でも保存できること' do
        @order_purchase_history.building = ''
        expect(@order_purchase_history).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号がカラだと登録できないこと' do
        @order_purchase_history.postal_code = ''
        @order_purchase_history.valid?
        expect(@order_purchase_history.errors.full_messages).to include('Postal code is invalid')
      end

      it '郵便番号が半角のハイフンを含んだ正しい形でないと保存できないこと' do
        @order_purchase_history.postal_code = '1234567'
        @order_purchase_history.valid?
        expect(@order_purchase_history.errors.full_messages).to include('Postal code is invalid')
      end

      it '都道府県を選択していないと保存できないこと' do
        @order_purchase_history.prefecture_id = 0
        @order_purchase_history.valid?
        expect(@order_purchase_history.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空だと保存できないこと' do
        @order_purchase_history.city = ''
        @order_purchase_history.valid?
        expect(@order_purchase_history.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと保存できないこと' do
        @order_purchase_history.addresses = ''
        @order_purchase_history.valid?
        expect(@order_purchase_history.errors.full_messages).to include("Addresses can't be blank")
      end

      it '電話番号が空だと保存できないこと' do
        @order_purchase_history.phone_number = ''
        @order_purchase_history.valid?
        expect(@order_purchase_history.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号は12桁の数値では保存できないこと' do
        @order_purchase_history.phone_number = '090123456789'
        @order_purchase_history.valid?
        expect(@order_purchase_history.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号は英数混合では保存できないこと' do
        @order_purchase_history.phone_number = '0901234567a'
        @order_purchase_history.valid?
        expect(@order_purchase_history.errors.full_messages).to include('Phone number is invalid')
      end

      it 'user_idが空だと購入できないこと' do
        @order_purchase_history.user_id = nil
        @order_purchase_history.valid?
        expect(@order_purchase_history.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと購入できないこと' do
        @order_purchase_history.item_id = nil
        @order_purchase_history.valid?
        expect(@order_purchase_history.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では保存できないこと' do
        @order_purchase_history.token = nil
        @order_purchase_history.valid?
        expect(@order_purchase_history.errors.full_messages).to include("Token can't be blank")
      end

      it '数字のみでないと登録できないこと（ハイフンあり）' do
        @order_purchase_history.phone_number = '090-1234-5678'
        @order_purchase_history.valid?
        expect(@order_purchase_history.errors.full_messages).to include("Phone number is invalid")
      end

      it '全角文字では登録できないこと' do
        @order_purchase_history.phone_number = '０９０１２３４５６７８'
        @order_purchase_history.valid?
        expect(@order_purchase_history.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
