class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_one_attached :image
  belongs_to :user
  has_one    :order

  with_options presence: true do
    validates :name
    validates :info
    validates :image
    validates :price, numericality: { only_integer: true, message: 'half-width number' },
                      inclusion: { in: 300..9_999_999, message: 'out of setting range' }, format: { with: /\A[0-9]+\z/ }
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
end
