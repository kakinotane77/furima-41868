class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :city_locality, :address, :building_name, :phone_number, :item_id, :user_id,
                :shipping_form_location_id

  with_options presence: true do
    validates :city_locality
    validates :address
    validates :shipping_form_location_id, numericality: { other_than: 1, message: "can't be blank" }
  end

  validates :postal_code, presence: { message: "can't be blank" }
  validates :postal_code,
            format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' },
            allow_blank: true

  validates :phone_number, presence: { message: "can't be blank" }
  validates :phone_number,
            format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid. Input only numbers' },
            allow_blank: true

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(
      postal_code: postal_code,
      city_locality: city_locality,
      address: address,
      building_name: building_name,
      phone_number: phone_number,
      order_id: order.id,
      shipping_form_location_id: shipping_form_location_id
    )
  end
end
