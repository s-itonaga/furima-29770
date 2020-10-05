class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order = @item.order.new(order_params)
    if @order.save
      redirect_to item_path(@item)
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order).merge(user_id: current_user.id)
  end

end
