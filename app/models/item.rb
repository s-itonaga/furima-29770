class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :comment
    validates :category
    validates :status
    validates :delivery_fee
    validates :prefectures
    validates :price
  end

    validates :category, numericality: { other_than: 1 }

end
