class  OrderPurchaseHistory
  include ActiveModel::Model

  attr_accessor :token, :item_id, :user_id, :postal_code, :city, :addresses, :phone_number, :prefecture_id, :building

  with_options presence: true do
      validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
      validates :city
      validates :addresses
      validates :phone_number,format: { with: /\A\d{10,11}\z/ }
      validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}
      validates :user_id
      validates :item_id
      validates :token
  end

def save
order = Order.create(item_id: item_id, user_id: user_id)
PurchaseHistory.create(postal_code: postal_code, city: city, addresses: addresses, building: building, phone_number: phone_number, prefecture_id: prefecture_id, order_id: order.id)
end
end

