FactoryBot.define do
  factory :item do
    name { 'ボール' }
    info { '大きい' }
    image { Faker::Lorem.sentence }
    association :user
    category_id            { 2 }
    sales_status_id        { 2 }
    shipping_fee_status_id { 2 }
    prefecture_id          { 2 }
    scheduled_delivery_id { 2 }
    price { 1000 }
  end
end
