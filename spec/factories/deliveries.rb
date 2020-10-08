FactoryBot.define do
  factory :delivery do
    postal_code    { '123-4567' }
    prefecture_id  { 2 }
    city           { '○○市' }
    address        { '××町12丁目３４番地' }
    building_name  { '△△ビル101' }
    phone_number　　{ 09011110000 }
  end
end
