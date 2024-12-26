class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_time
  belongs_to :shipping_fee_burden
  belongs_to :shipping_form_location

  validates :item_name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999
  }

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_time_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_burden_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_form_location_id, numericality: { other_than: 1, message: "can't be blank" }

  has_one :purchase_record
  has_one_attached :image
  belongs_to :user
end
