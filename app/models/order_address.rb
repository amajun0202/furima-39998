class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :origin_region_id, :city, :street_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
  validates :postal_code,       format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :origin_region_id,  numericality: {other_than: 1, message: "can't be blank"}
  validates :city         
  validates :street_number  
  validates :phone_number,      numericality: { only_integer: true }, length: { in: 10..11 }
  validates :user_id          
  validates :item_id          
  validates :token
  end            


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, origin_region_id: origin_region_id, city: city, street_number: street_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end