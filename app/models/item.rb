class Item < ApplicationRecord
with_options presence: true do
validates :name
validates :info
validates :price
validates :category_id
validates :sales_status_id
validates :shipping_fee_status_id
validates :prefecture_id
validates :scheduled_delivery_id
end

validates :image, presence: true, unless: :was_attached?

has_one_attached :image
belongs_to :user
belongs_to :category,numericality: { other_than: 1, message: "can't be blank" } 
belongs_to :sales_status,numericality: { other_than: 1, message: "can't be blank" } 
belongs_to :shipping_fee_status,numericality: { other_than: 1, message: "can't be blank" } 
belongs_to :prefecture,numericality: { other_than: 1, message: "can't be blank" } 
belongs_to :scheduled_delivery,numericality: { other_than: 1, message: "can't be blank" } 
# belongs_to :purchase_history

def was_attached?
  self.image.attached?
end

end



