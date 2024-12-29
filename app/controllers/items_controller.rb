class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
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
    params.require(:item).permit(:image, :item_name, :description, :category_id, :condition_id, :shipping_fee_burden_id,
                                 :shipping_form_location_id, :delivery_time_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    return if user_signed_in?

    redirect_to action: :index
  end
end
