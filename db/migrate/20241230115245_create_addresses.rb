class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code,     null: false
      t.string     :city_locality,   null: false
      t.string     :address,         null: false
      t.string     :building_name
      t.string     :phone_number,    null: false
      t.references :order,           null: false, foreign_key: true
      t.integer    :shipping_form_location_id,  null: false
      t.timestamps
    end
  end
end
