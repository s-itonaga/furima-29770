class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname,                  presence: true
         validates :family_name,               presence: true
         validates :name,                      presence: true
         validates :pronuciation_family_name,  presence: true
         validates :pronuciation_name,         presence: true
         validates :birth_dote,                presence: true
end
