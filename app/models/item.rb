class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_time
  belongs_to :shipping_fee_burden
  belongs_to :shipping_form_location
  belongs_to :user
  has_one :purchase_record
  has_one_attached :image

  validates :item_name, presence: { message: "can't be blank" }
  validates :description, presence: { message: "can't be blank" }

  validates :price, presence: { message: "can't be blank" }
  validates :price,
            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                            message: 'must be a valid half-width number between 300 and 9,999,999' },
            if: -> { price.present? }

  validates :category_id, :condition_id, :delivery_time_id,
            :shipping_fee_burden_id, :shipping_form_location_id,
            numericality: { other_than: 1, message: "can't be blank" }

  validate :image_presence

  private

  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end
end
