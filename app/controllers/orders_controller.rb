class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def crate
    
  end

end
