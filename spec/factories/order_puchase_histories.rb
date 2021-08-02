FactoryBot.define do
  factory :order_purchase_history do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '横浜' }
    addresses { '青山' }
    building { '青柳ビル' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
