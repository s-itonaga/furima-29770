FactoryBot.define do
  factory :item do
    image,             { '' }
    name,              { 'メルセデス' }
    comment,           { 'お買い得品' }
    category_id,       { '2' }
    status_id,         { '2' }
    delivery_fee_id,   { '2' }
    prefecture_id,     { '2' }
    delivery_day_id,   { '2' }
    price,             { '1000' }
    user_id            { '8' }
  end
end
