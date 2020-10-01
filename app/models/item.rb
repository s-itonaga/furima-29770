class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_day

  has_one_attached :image

  belongs_to :user


  validates :image,             presence: true
  validates :name,              presence: true, length: { maximum: 40 }
  validates :comment,           presence: true, length: { maximum: 1000 }
  validates :category_id,       numericality: { other_than: 1 }
  validates :status_id,         numericality: { other_than: 1 }
  validates :delivery_fee_id,   numericality: { other_than: 1 }
  validates :prefecture_id,     numericality: { other_than: 1 }
  validates :delivery_day_id,  numericality: { other_than: 1 }
  validates :price,             presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

end
