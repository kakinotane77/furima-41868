class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :image, :price, :category_id, :condition_id, :shipping_fee_burden_id,
                                 :shipping_form_location_id, :delivery_time_id).merge(user_id: current_user.id)
  end
end
