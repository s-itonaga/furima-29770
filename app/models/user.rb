class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :order

  with_options presence: true do
    validates :nickname
    validates :password,                  format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'は半角英数字混合で入力してください' }
    validates :family_name,               format: { with: /\A[ぁ-んァ-ン一-龥]/,    message: 'は全角で入力してください' }
    validates :name,                      format: { with: /\A[ぁ-んァ-ン一-龥]/,    message: 'は全角で入力してください' }
    validates :pronuciation_family_name,  format: { with: /\A[ァ-ヶー－]+\z/,      message: 'は全角カタカナで入力してください' }
    validates :pronuciation_name,         format: { with: /\A[ァ-ヶー－]+\z/,      message: 'は全角カタカナで入力してください' }
    validates :birth_date
  end
end
