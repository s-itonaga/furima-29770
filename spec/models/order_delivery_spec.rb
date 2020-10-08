require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  before do
    @order_delivery = FactoryBot.build(:order_delivery)
  end

  describe '配送先の住所登録' do
    it '郵便番号が必須であること' do
      @order_delivery.postal_code = ''
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid. Include hyphen(-)')
    end
    it '郵便番号にはハイフンが必要であること' do
      @order_delivery.postal_code = '1234567'
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it '都道府県の記述が必須であること' do
      @order_delivery.prefecture_id = 1
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it '市町村の記述が必須であること' do
      @order_delivery.city = ''
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("City can't be blank")
    end
    it '番地の記述が必須であること' do
      @order_delivery.address = ''
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が必須であること' do
      @order_delivery.phone_number = ''
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Phone number can't be blank", 'Phone number is not a number')
    end
    it '電話番号はハイフン不要で１１桁以内であること(ハイフンがある場合)' do
      @order_delivery.phone_number = '090-111-000'
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Phone number is not a number")
    end
    it '電話番号はハイフン不要で１１桁以内であること' do
      @order_delivery.phone_number = '090111110000'
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end

  end
end
