FactoryBot.define do
  factory :order_delivery do
    postal_code    { '123-4567' }
    prefecture_id  { 2 }
    city           { '宮崎市' }
    address        { '花が島町12丁目３４番地' }
    building_name  { '柳ビル101' }
    phone_number   { '09011110000' }
  end
end
