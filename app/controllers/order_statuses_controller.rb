class OrderStatusesController < ApplicationController

  def update
    @item = Item.find(params[:item_id])

    if @item.order_status.id == 1
      @item.update(order_status_id: 3)
    else @item.order_status.id == 3
      @item.update(order_status_id: 1)
    end

    redirect_back(fallback_location: root_path)
  end

end

