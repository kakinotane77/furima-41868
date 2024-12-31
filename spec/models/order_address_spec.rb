require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    context '購入できる場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_address).to be_valid
      end

      it '建物名が空でも保存できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '購入できない場合' do
      it '郵便番号が空では保存できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号にハイフンが含まれない場合は保存できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it '都道府県が未選択では保存できない' do
        @order_address.shipping_form_location_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Shipping form location can't be blank")
      end

      it '市区町村が空では保存できない' do
        @order_address.city_locality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City locality can't be blank")
      end

      it '番地が空では保存できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空では保存できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号いにハイフンが含まれている場合は保存できない' do
        @order_address.phone_number = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only numbers')
      end

      it '電話番号が9桁以下では保存できない' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only numbers')
      end

      it '電話番号が12桁以上では保存できない' do
        @order_address.phone_number = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only numbers')
      end

      it 'トークンが空では保存できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
