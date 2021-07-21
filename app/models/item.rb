class Item < ApplicationRecord
validates :name,  presence: true
validates :info,  presence: true
validates :price, presence: true
validates :image, presence: true

has_one_attached :image
belongs_to :user
belongs_to :purchase_history
end
