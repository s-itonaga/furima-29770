class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to root_path
  end

  private

  def item_params
    params.require( :item ).permit( :image, :name,  :comment, :category, :status, :delivery_fee, :prefectures, :delivery_days, :price ).merge( user_id: current_user.id )
  end

end
