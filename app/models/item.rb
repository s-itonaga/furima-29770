class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefectures
  belongs_to_active_hash :delivery_days

  belongs_to :user

  with_options presence: true do
    validates :name
    validates :comment
    validates :category
    validates :status
    validates :delivery_fee
    validates :prefectures
    validates :delivery_days
    validates :price
  end

    validates :category, numericality: { other_than: 1 }
    validates :status, numericality: { other_than: 1 }
    validates :delivery_fee, numericality: { other_than: 1 }
    validates :prefectures, numericality: { other_than: 1 }
    validates :delivery_days, numericality: { other_than: 1 }

  end
