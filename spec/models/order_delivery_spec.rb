require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  before do
    @order_delivery = FactoryBot.build(:order_delivery)
  end

  describe '配送先の住所登録' do
    it 'クレジットカード情報を記入し、トークンが必須であること' do
      @order_delivery.token = ''
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("正しいクレジットカードの情報を入力してください")
    end
    it '郵便番号が必須であること' do
      @order_delivery.postal_code = ''
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("郵便番号を入力してください", "郵便番号 が無効です。ハイフン(-)が必要です。")
    end
    it '郵便番号にはハイフンが必要であること' do
      @order_delivery.postal_code = '1234567'
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("郵便番号 が無効です。ハイフン(-)が必要です。")
    end
    it '都道府県の記述が必須であること' do
      @order_delivery.prefecture_id = 1
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("都道府県 は --- 以外を入力してください")
    end
    it '市町村の記述が必須であること' do
      @order_delivery.city = ''
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("市区町村を入力してください")
    end
    it '番地の記述が必須であること' do
      @order_delivery.address = ''
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("番地を入力してください")
    end
    it '電話番号が必須であること' do
      @order_delivery.phone_number = ''
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("電話番号を入力してください", "電話番号は数値で入力してください")
    end
    it '電話番号はハイフン不要で１１桁以内であること(ハイフンがある場合)' do
      @order_delivery.phone_number = '090-111-000'
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("電話番号は数値で入力してください")
    end
    it '電話番号はハイフン不要で１１桁以内であること(ハイフンなしで12桁ある場合)' do
      @order_delivery.phone_number = '090111110000'
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("電話番号は11文字以内で入力してください")
    end

  end
end
