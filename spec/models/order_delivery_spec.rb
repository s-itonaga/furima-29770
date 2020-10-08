require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  before do
    @delivery = FactryBot.buid(:delivery)
  end

  describe "配送先の住所登録" do
    it '郵便番号が必須であること' do
    end
    it '郵便番号にはハイフンが必要であること' do
    end
    it '都道府県の記述が必須であること' do
    end
    it '市町村の記述が必須であること' do
    end
    it '番地の記述が必須であること' do
    end
    it '電話番号が必須であること' do
    end
    it '電話番号はハイフン不要で１１桁以内であること' do
    end
  end
end
