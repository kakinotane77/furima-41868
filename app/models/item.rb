class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_time
  belongs_to :shipping_fee_burden
  belongs_to :shipping_form_location

  validates :item_name, :string, presence: true
  validates :description, :text, presence: true
  validates :price, :integer, presence: true

  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :delivery_time_id, numericality: { other_than: 1 }
  validates :shipping_fee_burden_id, numericality: { other_than: 1 }
  validates :shipping_form_location_id, numericality: { other_than: 1 }

  has_one :purchase_record
  has_one_attached :image
  belongs_to :user
end
