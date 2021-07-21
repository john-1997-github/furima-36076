class Item < ApplicationRecord
with_options presence: true do
validates :name
validates :info
validates :price
validates :category_id, numericality: { other_than: 0, message: "can't be blank" }
validates :sales_status_id, numericality: { other_than: 0, message: "can't be blank" }
validates :shipping_fee_status_id, numericality: { other_than: 0, message: "can't be blank" }
validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
validates :scheduled_delivery_id, numericality: { other_than: 0, message: "can't be blank" }
end

validates :image, presence: true
has_one_attached :image

belongs_to :user
belongs_to :category
belongs_to :sales_status
belongs_to :shipping_fee_status
belongs_to :prefecture
belongs_to :scheduled_delivery
# belongs_to :purchase_history


end



