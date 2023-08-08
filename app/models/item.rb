class Item < ApplicationRecord

  validates :name, presence: true
  validates :memo, presence: true
  validates :status_id, presence: true
  validates :chage_bearer_id, presence: true
  validates :shopping_area_id, presence: true
  validates :delivary_day_id, presence: true
  validates :price, presence: true
  validates :user, presence: true
  validates :category_id, presence: true

  belongs_to :user
  has_one_attached :image
end
