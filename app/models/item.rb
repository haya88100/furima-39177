class Item < ApplicationRecord

  def sold_out?
    order.present?
  end

  validates :name, presence: true
  validates :memo, presence: true
  validates :status_id, presence: true, numericality: { other_than: 1, message: "must be other than 1" }
  validates :chage_bearer_id, presence: true, numericality: { other_than: 1, message: "must be other than 1" }
  validates :shopping_area_id, presence: true, numericality: { other_than: 1, message: "must be other than 1" }
  validates :delivary_day_id, presence: true, numericality: { other_than: 1, message: "must be other than 1" }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id, presence: true, numericality: { other_than: 1, message: "must be other than 1" }
  validates :image, presence: true

 

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shopping_area 
  belongs_to :chage_bearer 
  belongs_to :delivary_day
  has_one :order
end
