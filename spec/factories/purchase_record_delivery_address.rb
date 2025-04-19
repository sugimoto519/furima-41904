FactoryBot.define do
  factory :purchase_record_delivery_address do
    postal_code    {'123-4567'}
    prefecture_id  { 1 }
    city           { '東京都' }
    block_number   { '1-1' }
    phone_number   { '09012345678' }
    user_id        { 1 }
    item_id        { 1 }
  end
end
