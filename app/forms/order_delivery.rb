class OrderDelivery

  include ActiveModel::Model
  attr_accessor :user_id, :item_id

  with_options precense: true do
    validates :token
    validates :postal_code,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city,         format: { with: /\A[ぁ-んァ-ン一-龥]/,    message: 'は全角で入力してください' }
    validates :address,      format: { with: /\A[ぁ-んァ-ン一-龥]/,    message: 'は全角で入力してください' }
    validates :phone_number, numericality: {only_integer: true }, length:{maxmam: 11}
  end

  validates :prefecture_id,  numericality: { other_than: 1 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Delivery.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end