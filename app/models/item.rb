class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :info
    validates :image
    validates :price, numericality: { only_integer: true, message: 'half-width number' },
                      inclusion: { in: 300..9_999_999, message: 'out of setting range' }, format: { with: /\A[0-9]+\z/ }
    validates :category_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :sales_status_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :shipping_fee_status_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :scheduled_delivery_id, numericality: { other_than: 0, message: "can't be blank" }
  end


  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  # belongs_to :purchase_history
end
