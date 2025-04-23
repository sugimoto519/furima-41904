FactoryBot.define do
  factory :purchase_record_delivery_address do
    postal_code    { '123-4567' }
    prefecture_id  { 2 }
    city           { '東京都' }
    block_number   { '1-1' }
    phone_number   { '09012345678' }
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end
