class Delivery < ApplicationRecord
  belongs_to :order

  with_options precense: true do
    validates :postal_code,  numericality: { with: /\A\d{3}[-]\d{4}\z/}
    validates :prefectures,  format: { with: /\A[ぁ-んァ-ン一-龥]/,    message: 'は全角で入力してください' }
    validates :city,         format: { with: /\A[ぁ-んァ-ン一-龥]/,    message: 'は全角で入力してください' }
    validates :address,      format: { with: /\A[ぁ-んァ-ン一-龥]/,    message: 'は全角で入力してください' }
    validates :phone_number, numericality: {only_integer: true }, length:{maxmam: 11}
  end

  validates :puchase_id,     numericality: { other_than: 1 }

end
