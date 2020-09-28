require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it 'ニックネームが必須であること' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank", 'Nickname は全角で入力してください')
    end
    it 'メールアドレスが必須であること' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスは@を含む必要があること' do
      @user.email = 'testtest'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'パスワードが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードは6文字以上であること' do
      @user.password = '000aa'
      @user.password_confirmation = '000aa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'パスワードは半角英数字混合であること(全角で入力)' do
      @user.password = 'ああああああ'
      @user.password_confirmation = 'ああああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください')
    end
    it 'パスワードは半角英数字混合であること(半角数字のみで入力)' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は半角英数字混合で入力してください")
    end
    it 'パスワードは半角英数字混合であること(半角英字のみで入力)' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は半角英数字混合で入力してください")
    end
    it 'パスワードは確認用を含めて2回入力すること' do
      @user.password_confirmation = '000aa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'ユーザー本名の、名字が必須であること' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank", 'Family name は全角で入力してください')
    end
    it 'ユーザー本名の、名前が必須であること' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank", 'Name は全角で入力してください')
    end
    it 'ユーザー本名の名字は全角（漢字・ひらがな・カタカナ）で入力させること' do
      @user.family_name = 'satou'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name は全角で入力してください')
    end
    it 'ユーザー本名の名前は全角（漢字・ひらがな・カタカナ）で入力させること' do
      @user.name = 'takao'
      @user.valid?
      expect(@user.errors.full_messages).to include('Name は全角で入力してください')
    end
    it 'ユーザー本名のフリガナが、名字が必須であること' do
      @user.pronuciation_family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Pronuciation family name can't be blank", 'Pronuciation family name は全角カタカナで入力してください')
    end
    it 'ユーザー本名のフリガナが、名前が必須であること' do
      @user.pronuciation_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Pronuciation name can't be blank", 'Pronuciation name は全角カタカナで入力してください')
    end
    it 'ユーザー本名・名字のフリガナは全角（カタカナ）で入力させること' do
      @user.pronuciation_family_name = 'さとう'
      @user.valid?
      expect(@user.errors.full_messages).to include('Pronuciation family name は全角カタカナで入力してください')
    end
    it 'ユーザー本名・名前のフリガナは全角（カタカナ）で入力させること' do
      @user.pronuciation_name = 'たかお'
      @user.valid?
      expect(@user.errors.full_messages).to include('Pronuciation name は全角カタカナで入力してください')
    end
    it '生年月日が必須であること' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
