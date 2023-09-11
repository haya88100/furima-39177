class OrderAddress
  include ActiveModel::Model

  attr_accessor :postal_code, :shopping_area_id, :city, :house_number, :building_name, :phone_number, :item_id, :user_id, :token, :price

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "should be 10 or 11 digits long and contain only numeric characters" }
    validates :city
    validates :house_number
    validates :token
  end

  validates :shopping_area_id, presence: true, numericality: { other_than: 1, message: "must be other than 1" }

  def save
    order =  Order.create(item_id: item_id, user_id: user_id)

    Address.create(postal_code: postal_code, shopping_area_id: shopping_area_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end