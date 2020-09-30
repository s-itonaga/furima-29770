class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category_id
  belongs_to_active_hash :status_id
  belongs_to_active_hash :delivery_fee_id
  belongs_to_active_hash :prefecture_id
  belongs_to_active_hash :delivery_day_id

  has_one_attached :image

  belongs_to :user


  validates :image,             presence: true, length: { maximum: 40 }
  validates :name,              presence: true, length: { maximum: 1000 }
  validates :comment,           presence: true
  validates :category_id,       numericality: { other_than: 1 }
  validates :status_id,         numericality: { other_than: 1 }
  validates :delivery_fee_id,   numericality: { other_than: 1 }
  validates :prefectures_id,    numericality: { other_than: 1 }
  validates :delivery_days_id,  numericality: { other_than: 1 }
  validates :price,             numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

end
