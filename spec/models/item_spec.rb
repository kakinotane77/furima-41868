require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '出品登録できるとき' do
    it 'item_name、description、image、price、category_id、condition_id、shipping_fee_burden_id 、shipping_form_location_id、delivery_timeが存在すれば登録できる' do
      expect(@item).to be_valid
    end
  end
  context '出品登録できないとき' do
    it 'nicknameが空では登録できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
    it 'descriptionが空では登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが半角数値以外では登録できない' do
      @item.price = '１００００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be a valid half-width number between 300 and 9,999,999')
    end
    it 'priceが¥300未満では登録できない' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be a valid half-width number between 300 and 9,999,999')
    end
    it 'priceが¥9,999,999より大きい場合では登録できない' do
      @item.price = '10,000,000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be a valid half-width number between 300 and 9,999,999')
    end
    it 'imageが空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'category_idが1（---）では登録できない' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'condition_idが1（---）では登録できない' do
      @item.condition_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end
    it 'shipping_fee_burden_idが1（---）では登録できない' do
      @item.shipping_fee_burden_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee burden can't be blank")
    end
    it 'shipping_form_location_idが1（---）では登録できない' do
      @item.shipping_form_location_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping form location can't be blank")
    end
    it 'delivery_time_idが1（---）では登録できない' do
      @item.delivery_time_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery time can't be blank")
    end
    it 'userが紐づいていないとは登録できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end
