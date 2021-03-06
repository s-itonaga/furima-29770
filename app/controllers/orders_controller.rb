class OrdersController < ApplicationController
  before_action :set_item
  before_action :move_to_rogin
  before_action :move_to_root

  def index
    @order = Order.new
  end

  def create
    @order = OrderDelivery.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def move_to_root
    redirect_to root_path if user_signed_in? && current_user.id == @item.user.id || @item.order.present?
  end

  def move_to_rogin
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.permit(:token, :item_id, :postal_code, :prefecture_id, :city,
                  :address, :building_name, :phone_number).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
