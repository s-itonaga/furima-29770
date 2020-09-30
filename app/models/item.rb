class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category_id
  belongs_to_active_hash :status_id
  belongs_to_active_hash :delivery_fee_id
  belongs_to_active_hash :prefecture_id
  belongs_to_active_hash :delivery_day_id

  has_one_attached :image

  belongs_to :user

  with_options presence: true do
    validates :image
    validates :name
    validates :comment
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :delivery_day_id
    validates :price
  end

    validates :category_id,       numericality: { other_than: 1 }
    validates :status_id,         numericality: { other_than: 1 }
    validates :delivery_fee_id,   numericality: { other_than: 1 }
    validates :prefectures_id,    numericality: { other_than: 1 }
    validates :delivery_days_id,  numericality: { other_than: 1 }
end
