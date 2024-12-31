class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :check_item_owner, only: [:index]
  before_action :check_order_status, only: [:index, :create]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params.merge(item_id: @item.id))

    if @order_address.valid? && pay_item && @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def check_order_status
    return unless @item.order.present?

    redirect_to root_path
  end

  def check_item_owner
    return unless @item.user_id == current_user.id

    redirect_to root_path
  end

  def order_params
    params.require(:order_address).permit(
      :postal_code,
      :city_locality,
      :address,
      :building_name,
      :phone_number,
      :item_id,
      :shipping_form_location_id,
      :token
    ).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
    true
  rescue StandardError
    false
  end
end
