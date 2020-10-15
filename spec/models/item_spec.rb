require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end
  describe '商品出品' do
    it '画像は1枚必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("画像を入力してください")
    end
    it '商品名が必須であること' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end
    it '商品の説明が必須であること' do
      @item.comment = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の説明を入力してください")
    end
    it 'カテゴリーの情報が必須であること' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーは --- 以外を入力してください")
    end
    it '商品の状態についての情報が必須であること' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の状態は --- 以外を入力してください")
    end
    it '配送料の負担についての情報が必須であること' do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料の負担は --- 以外を入力してください")
    end
    it '発送元の地域についての情報が必須であること' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("発送元の地域は --- 以外を入力してください")
    end
    it '発送までの日数についての情報が必須であること' do
      @item.delivery_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("発送までの時間は --- 以外を入力してください")
    end
    it '価格についての情報が必須であること' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("価格を入力してください", "価格は数値で入力してください")
    end
    it '価格の範囲が、¥300~¥9,999,999の間であること(299円以下で入力)' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は300以上の値にしてください")
    end
    it '価格の範囲が、¥300~¥9,999,999の間であること(100000000円以上で入力)' do
      @item.price = 100_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は9999999以下の値にしてください")
    end
    it '販売価格は半角数字のみ保存可能であること(全角で入力)' do
      @item.price = 'ああああああ'
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は数値で入力してください")
    end
    it '販売価格は半角数字のみ保存可能であること(半角英字で入力)' do
      @item.price = 'aaaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は数値で入力してください")
    end
  end
end
