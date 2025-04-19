FactoryBot.define do
  factory :delivery_address do
    postal_code {'123-4567'}
    prefecture_id { 1 }
    city { '東京都' }
    block_number { '1-1' }
    phone_number { '09012345678' }
  end
end
