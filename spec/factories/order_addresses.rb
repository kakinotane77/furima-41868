FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    city_locality { '東京都' }
    address { '新宿1-1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678' }
    shipping_form_location_id { 2 }
    token { 'tok_abcdefghijk00000000000000000' }
    item_id { 1 }
    user_id { 1 }
  end
end
