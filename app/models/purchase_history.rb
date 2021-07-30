class PurchaseHistory < ApplicationRecord
  with_options presence: true do
      validates :postal_code
      validates :city
      validates :addresses
      validates :building
      validates :phone_number
      validates :prefecture_id
      validates :user_id
      validates :item_id
  end

  belongs_to :order

end
