class Item < ApplicationRecord

  validates :name, presence: true
  validates :memo, presence: true
  validates :status_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :chage_bearer_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shopping_area_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivary_day_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true
  validates :user, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}

 

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shopping_area
  belongs_to :chage_bearer
  belongs_to :delivary_day
end
