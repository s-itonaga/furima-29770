class OrderDelivery

  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number

  with_options presence: true do
    validates :token
    validates :postal_code,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :phone_number, numericality: {only_integer: true }, length:{maximum: 11}
  end

  validates :prefecture_id,  numericality: { other_than: 1 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id, token: token)
    Delivery.create(postal_code: postal_code, prefecture_id: prefecture_id,
                       city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end