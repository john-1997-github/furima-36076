require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '出品ができる時' do
      it '必要な情報を適切に入力して「出品する」ボタンを押すと、商品情報がデータベースに保存されること' do
        expect(@item).to be_valid
      end
    end

    context '出品ができない時' do
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include { "Image can't be blank" }
      end

      it '商品名が必須であること' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が必須であること' do
        @item.info = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end

      it 'カテゴリーの情報が必須であること' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 0')
      end

      it '商品の状態についての情報が必須であること' do
        @item.sales_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales status must be other than 0')
      end

      it '配送料の負担についての情報が必須であること' do
        @item.shipping_fee_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee status must be other than 0')
      end

      it '発送元の地域についての情報が必須であること' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 0')
      end

      it '発送までの日数についての情報が必須であること' do
        @item.scheduled_delivery_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Scheduled delivery must be other than 0')
      end

      it '販売価格についての情報が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '売価格は、¥299以下の時は保存できないこと。' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price out of setting range')
      end

      it '売価格は、¥100000000以上の時は保存できないこと。' do
        @item.price = 100_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price out of setting range')
      end

      it '販売価格は半角数字のみ保存可能であること' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price half-width number')
      end

      it '商品に紐づくUser必須であること' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
